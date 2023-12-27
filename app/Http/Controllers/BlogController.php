<?php

namespace App\Http\Controllers;

use App\Models\Blog\Post;
use App\Models\Page;
use Inertia\Inertia;

class BlogController extends Controller
{
    public function index()
    {
        $posts = Post::with('category', 'tags', 'author')->where('published_at', '<=', date('Y-m-d'))->orderBy('created_at', 'desc')->paginate(10);
        return Inertia::render('Blog/Index', compact('posts'));
    }

    public function show($slug)
    {
        $post = Post::with('category', 'tags', 'author')->whereSlug($slug)->firstOrFail();
        $relatedPosts = Post::with('category', 'tags', 'author')->where('blog_category_id', $post->blog_category_id)->where('id', '!=', $post->id)->orderByDesc('created_at')->limit(3)->get();
        return Inertia::render('Blog/Detail', compact('post', 'relatedPosts'));
    }
}
