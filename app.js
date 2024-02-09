new Vue({
  el: '#app',
  data: {
    articles: []
  },
  mounted() {
    this.fetchNews();
  },
  methods: {
    async fetchNews() {
      const apiKey = '536edac0b8694b6298e1bca491b708a3';
      const apiUrl = `https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=${apiKey}`;

      try {
        const response = await fetch(apiUrl);
        const data = await response.json();

        if (data.status === 'ok') {
          this.articles = data.articles;
        } else {
          console.error('Error fetching news:', data.message);
        }
      } catch (error) {
        console.error('Error fetching news:', error);
      }
    }
  }
});
