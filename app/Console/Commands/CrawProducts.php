<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\HttpClient\HttpClient;

class CrawProducts extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:craw-products';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        //
        $browser = new HttpBrowser(HttpClient::create());

        $categories = [
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=10',
                'name' => 'Hạt giống tâm hồn',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=36',
                'name' => 'Phật giáo - Tâm linh',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=3',
                'name' => 'Tư duy - Sống đẹp',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=8',
                'name' => 'Thiếu nhi',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=12',
                'name' => 'Ngoại ngữ',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=11',
                'name' => 'Quản lý',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=24',
                'name' => 'Kỹ năng',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=4',
                'name' => 'Kinh doanh',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=6',
                'name' => 'Danh nhân',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=5',
                'name' => 'Văn học',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=17',
                'name' => 'Sống khỏe',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=9',
                'name' => 'Y học gia đình',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=21',
                'name' => 'Nuôi dạy con',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=20',
                'name' => 'Song ngữ',
            ],
            [
                'href' => 'https://firstnews.vn/san-pham?cate_id=26',
                'name' => 'Bộ Sách',
            ],
        ];
        $products = [];

        foreach ($categories as $category) {
            $crawler = $browser->request('GET', $category['href']);
            $this->crawPage($crawler, $browser, $category['href'], $category['name'], $products);
        }

        //Write to json file
        $json = json_encode($products, JSON_PRETTY_PRINT);
        file_put_contents(storage_path('app/products.json'), $json);
    }

    private function crawPage(Crawler $crawler, HttpBrowser $browser, $url, $catName, &$products): void
    {
        $page = 1;
        while (true) {
            $productEls = $crawler->filter('#load-product-filter .product-normal-cpn');
            if (! $productEls->count()) {
                break;
            }
            $productEls->each(function ($node) use (&$products, $catName) {
                $title = $node->filter('.title')->text();
                $price = $node->filter('.ps-price')->text();
                $image = $node->filter('.image img')->attr('src');
                $href = $node->filter('.title')->attr('href');

                $products[] = [
                    'title' => $title,
                    'price' => $this->formatPrice($price),
                    'image' => $image,
                    'href' => $href,
                    'category' => $catName,
                ];
            });

            $crawler = $browser->request('GET', $url . '&page=' . ++$page);
        }
        $this->crawProductInfo($products);
    }

    private function crawProductInfo(&$products): void
    {
        $browser = new HttpBrowser(HttpClient::create());

        foreach ($products as &$product) {
            $crawler = $browser->request('GET', $product['href']);
            $product['description'] = $crawler->filter('.content-text')->html();
        }
    }

    private function formatPrice($str)
    {
        $str = str_replace('đ', '', $str);
        $str = str_replace('.', '', $str);
        return (int) $str;
    }
}
