import type { APIRoute } from "astro";
import { getCollection } from "astro:content";

export const GET: APIRoute = async () => {
    const allDocs = await getCollection("docs");
    const posts = allDocs
        .sort((a, b) => {
            const orderA = a.data.sidebar?.order ?? Number.MAX_SAFE_INTEGER;
            const orderB = b.data.sidebar?.order ?? Number.MAX_SAFE_INTEGER;
            if (orderA !== orderB) {
                return orderA - orderB;
            }
            return a.slug.localeCompare(b.slug);
        })
        .map(doc => {
            const cleanBody = doc.body
                // Remove <Preview> tags but keep their content
                .replace(/<Preview[^>]*>([\s\S]*?)<\/Preview>/g, '$1')
                // Remove lines that import .astro files (e.g., "import Preview from '../../components/Preview.astro';")
                .replace(/^.*\.astro['"];?\s*$/gm, '')
                // Replace multiple consecutive newlines with exactly 2 newlines to remove large gaps
                .replace(/\n{3,}/g, '\n\n');
            return `# ${doc.data.title}\n${cleanBody}`;
        });

    return new Response(posts.join('\n\n---\n\n'), {
        status: 200,
        headers: { "Content-Type": "text/plain; charset=utf-8" }
    });
};
