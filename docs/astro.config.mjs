// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'Flutter Shadcn UI docs',
      components: {
        LanguageSelect: './src/components/SelectColor.astro',

      },
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
          items: [
            {
              label: 'Submit your app',
              link: 'submit-your-app',
            },
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
            {
              label: 'Prompt Builder',
              link: 'https://promptbuilder.site/',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'buildr.studio',
              link: 'https://github.com/code-on-sunday/buildr.studio',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Yandex Eats Clone',
              link: 'https://github.com/itsezlife/yandex-eats-clone',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Due Kasir',
              link: 'https://play.google.com/store/apps/details?id=com.devindo.due_kasir',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Snap Ink',
              link: 'https://www.snapink.pro/',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Cleaner for Flutter',
              link: 'https://apps.apple.com/us/app/cleaner-for-flutter/id6661026876',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Gessential',
              link: 'https://github.com/mirarr-app/Gessential',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'Movie Paradise',
              link: 'https://movieparadise.app/',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },
            {
              label: 'ZikZak AI',
              link: 'https://zuzu.dev',
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
