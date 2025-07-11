/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./_layouts/**/*.html",
    "./_includes/**/*.html", 
    "./_posts/**/*.md",
    "./*.html",
    "./*.md"
  ],
  theme: {
    extend: {
      colors: {
        'custom-gray': {
          50: '#f8f9fa',
          100: '#f1f3f4',
          200: '#e8eaed',
          300: '#dadce0',
          400: '#bdc1c6',
          500: '#9aa0a6',
          600: '#494a50',
          700: '#3a3b40',
          800: '#2b2c30',
          900: '#1c1d20',
        }
      }
    },
  },
  plugins: [],
} 
