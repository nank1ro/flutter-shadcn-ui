// @ts-check
import { readFileSync } from 'node:fs';
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// The "Apps created with Flutter Shadcn UI" entries live in a plain JSON data
// file. They are appended by .github/scripts/add-app-to-docs.js from issue
// submissions. Loading them as data (JSON.parse), rather than generating/eval'ing
// JS, keeps attacker-influenced values inert. See GHSA-r2gv-jrj7-hp4v.
const apps = JSON.parse(
  readFileSync(new URL('./apps.json', import.meta.url), 'utf8'),
);

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'Flutter Shadcn UI docs',
      components: {
        LanguageSelect: './src/components/SelectColor.astro',
      },
      customCss: ['./src/fonts.css'],
      social: {
        github: 'https://github.com/nank1ro',
        twitter: 'https://twitter.com/nank1ro'
      },
      head: [
        {
          tag: 'meta',
          attrs: {
            property: 'og:image',
            content: 'https://mariuti.com/flutter-shadcn-ui/shadcn-banner.png',
          }
        },
        {
          tag: 'link',
          attrs: {
            rel: 'preconnect',
            href: 'https://cdn.jsdelivr.net',
            crossorigin: ''
          },
        },
        {
          tag: 'script',
          attrs: {
            defer: true,
            src: 'https://umami.mariuti.com/script.js',
            'data-website-id': '682aff24-32d8-48eb-b29a-a8ec596dc1e4',
          },
        },
      ],
      sidebar: [
        {
          label: 'mariuti.com',
          link: 'https://mariuti.com',
          badge: { text: 'Author', variant: 'tip' },
          attrs: { target: '_blank' },
        }, {
          label: 'pub.dev',
          link: 'https://pub.dev/packages/shadcn_ui',
          attrs: { target: '_blank', rel: 'noopener noreferrer' },
        },
        {
          label: 'Flutter Shadcn UI',
          collapsed: false,
          items: [
            { label: 'Getting started', link: '' },
            {
              label: 'Theme',
              autogenerate: { directory: 'Theme' },
              collapsed: false,
            },
            { label: 'Typography', link: 'typography' },
            { label: 'Packages', link: 'packages' },
            {
              label: 'Components',
              autogenerate: { directory: 'Components' },
              collapsed: false,
            },
            {
              label: 'Utils',
              autogenerate: { directory: 'Utils' },
              collapsed: false,
            },
          ],
        },
        {
          label: 'Apps created with Flutter Shadcn UI',
          collapsed: false,
          items: apps,
        }
      ],
    }),
  ],
  site: 'https://mariuti.com/flutter-shadcn-ui',
  base: 'flutter-shadcn-ui/',
  output: "static",
  build: {
    format: 'directory',
  },
  outDir: './dist/flutter-shadcn-ui',
});
