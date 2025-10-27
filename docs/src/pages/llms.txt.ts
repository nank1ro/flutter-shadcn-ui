import type { APIRoute } from "astro";
import { getCollection } from "astro:content";

export const GET: APIRoute = async () => {
    const allDocs = await getCollection("docs");
    const posts = allDocs.map(doc => doc.body);
    
    return new Response(posts.join('\n\n---\n\n'), {
        status: 200,
        headers: { "Content-Type": "text/plain; charset=utf-8" }
    });
};