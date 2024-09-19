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
          content: 'https://mariuti.com/shadcn-ui/assets/shadcn-banner.png',
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
          attrs: { target: '_blank' },
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
      ],
    }),
  ],
  site: 'https://mariuti.com/shadcn-ui',
  output: "static",
});
