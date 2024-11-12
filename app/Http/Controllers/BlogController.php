<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResource;
use App\Http\Resources\ProductResource;
use App\Models\Blog\Category;
use App\Models\Blog\Post;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Inertia\Inertia;
use Spatie\Tags\Tag;

class BlogController extends Controller
{
    public function index()
    {
        $categorySlug = request()->category;
        $tag = request()->tag;
        $query = Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->orderBy('created_at', 'desc');
        $category = null;
        if ($categorySlug) {
            $category = Category::whereSlug($categorySlug)->firstOrFail();
            $query->whereHas('category', function ($query) use ($categorySlug) {
                $query->whereSlug($categorySlug);
            });
        }

        if ($tag) {
            $query->withAnyTags([$tag]);
        }
        $posts = $query->paginate(10);
        $featuredPosts = Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->where('is_featured', 1)->orderBy('created_at', 'desc')->limit(5)->get();
        $categories = Category::withCount('posts')->orderBy('posts_count', 'desc')->limit(10)->get();
        $tags = Tag::orderBy('name')->get()->pluck('name');

        $links = $posts->linkCollection();
        $posts = PostResource::collection($posts);

        return Inertia::render('Blog/Index', compact('posts', 'links', 'featuredPosts', 'categories', 'tags', 'category', 'tag'));
    }

    public function show($slug)
    {
        $post = Post::with('category', 'tags', 'author')->whereSlug($slug)->firstOrFail();
        $relatedPosts = Post::with('category', 'tags', 'author')->where('blog_category_id', $post->blog_category_id)->where('id', '!=', $post->id)->orderByDesc('created_at')->limit(3)->get();
        $featuredPosts = Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->where('is_featured', 1)->orderBy('created_at', 'desc')->limit(5)->get();
        $tags = Tag::orderBy('name')->get()->pluck('name');
        $categories = Category::withCount('posts')->orderBy('posts_count', 'desc')->limit(10)->get();

        return Inertia::render('Blog/Detail', compact('post', 'relatedPosts', 'featuredPosts', 'tags', 'categories'));
    }
}
