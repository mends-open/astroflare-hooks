import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import alpinejs from "@astrojs/alpinejs";
import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind(), alpinejs()],
  output: "server",
  adapter: cloudflare({
    routes: {
      extend: {
        include: [{ pattern: '/functions' }],
      }
    },
  }),
});