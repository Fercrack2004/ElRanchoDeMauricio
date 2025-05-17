/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./app/views/**/*.html.erb",
      "./app/helpers/**/*.rb",
      "./app/javascript/**/*.js"
    ],
    theme: {
      extend: {
        colors: {
          primary: {
            800: '#991b1b',
            700: '#b91c1c',
            600: '#dc2626',
            DEFAULT: '#ef4444',
            400: '#f87171',
            300: '#fca5a5',
            50: '#fef2f2'
          },
          secondary: {
            800: '#166534',
            700: '#15803d',
            600: '#16a34a',
            DEFAULT: '#22c55e',
            400: '#4ade80',
            300: '#86efac',
            50: '#f0fdf4'
          },
          accent: {
            DEFAULT: '#f59e0b',
            600: '#d97706',
            400: '#fbbf24'
          }
        },
        fontFamily: {
          'cursive': ['"Dancing Script"', 'cursive'],
          'sans': ['"Open Sans"', 'sans-serif'],
          'serif': ['"Playfair Display"', 'serif']
        },
        backgroundImage: {
          'hero-pattern': "url('https://images.unsplash.com/photo-1543351611-58f69d7c1781?q=80&w=2070&auto=format&fit=crop')",
          'texture': "url('https://www.transparenttextures.com/patterns/cream-pixels.png')"
        }
      }
    },
    plugins: [],
  }
  