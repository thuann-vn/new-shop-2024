<?php

namespace App\Http\Controllers;

use App\Http\Resources\BlogCategoryResource;
use App\Http\Resources\PostResource;
use App\Models\Blog\Category;
use App\Models\Blog\Post;
use Artesaos\SEOTools\Facades\SEOTools;
use Inertia\Inertia;
use Spatie\Tags\Tag;

class BlogController extends Controller
{
    public function index()
    {
        $locale = app()->getLocale();
        $categorySlug = request()->category;
        $tag = request()->tag;
        $query = Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->orderBy('created_at', 'desc');
        $category = null;
        if ($categorySlug) {
            $category = new BlogCategoryResource(Category::where('slug->' . $locale, $categorySlug)->firstOrFail());
            $query->whereHas('category', function ($query) use ($categorySlug) {
                $query->whereSlug($categorySlug);
            });
        }

        if ($tag) {
            $query->withAnyTags([$tag]);
        }
        $posts = $query->paginate(10);
        $featuredPosts = PostResource::collection(Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->where('is_featured', 1)->orderBy('created_at', 'desc')->limit(5)->get());
        $categories = BlogCategoryResource::collection(Category::withCount('posts')->orderBy('posts_count', 'desc')->limit(10)->get());
        $tags = Tag::orderBy('name')->get()->pluck('name');

        $links = $posts->linkCollection();
        $posts = PostResource::collection($posts);

        //Seo information
        SEOTools::setTitle(! empty($category) ? $category['name'] : __('Blog'));
        SEOTools::setDescription(! empty($category) ? $category['description'] : getGeneralSettings('site_description'));
        if (! empty($category->featured_image_url)) {
            SEOTools::addImages($category->featured_image_url);
        }

        return Inertia::render('Blog/Index', compact('posts', 'links', 'featuredPosts', 'categories', 'tags', 'category', 'tag'));
    }

    public function show($slug)
    {
        $locale = app()->getLocale();
        $post = Post::with('category', 'tags', 'author')->where('slug->' . $locale, $slug)->firstOrFail();
        $relatedPosts = PostResource::collection(Post::with('category', 'tags', 'author')->where('blog_category_id', $post->blog_category_id)->where('id', '!=', $post->id)->orderByDesc('created_at')->limit(3)->get());
        $featuredPosts = PostResource::collection(Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->where('is_featured', 1)->orderBy('created_at', 'desc')->limit(5)->get());
        $tags = Tag::orderBy('name')->get()->pluck('name');
        $categories = BlogCategoryResource::collection(Category::withCount('posts')->orderBy('posts_count', 'desc')->limit(10)->get());

        //Seo information
        SEOTools::setTitle(firstNotEmpty($post->seo_title, $post->title, getGeneralSettings('site_name')));
        SEOTools::setDescription($post->seo_description ?? getGeneralSettings('site_description'));
        if (! empty($post->featured_image_url)) {
            SEOTools::addImages($post->featured_image_url);
        }
        // Use resource
        $post = new PostResource($post);

        return Inertia::render('Blog/Detail', compact('post', 'relatedPosts', 'featuredPosts', 'tags', 'categories'));
    }
}
