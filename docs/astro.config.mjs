// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'Flutter Shadcn UI docs',
      social: {
        github: 'https://github.com/nank1ro',
        twitter: 'https://twitter.com/nank1ro'
      },
      head: [{
        tag: 'meta',
        attrs: {
          property: 'og:image',
          content: 'https://flutter-shadcn-ui.mariuti.com/shadcn-banner.png',
        }
      }],
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
          items: [
            {
              label: 'Notes Calculator',
              link: 'https://notescalculator.com',
              attrs: { target: '_blank' },
            },
            {
              label: 'Pic Gen',
              link: 'https://apps.apple.com/ca/app/pic-gen-generate-ai-pictures/id6670408981',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'ATColombia',
              link: 'https://atcolombia.co',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
          ],

        }
      ],
    }),
  ],
  site: 'https://flutter-shadcn-ui.mariuti.com',
  output: "static",
});
