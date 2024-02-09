<template>
  <div class="container">
    <div class="searchbar">
        <form action="">
            <input type="text"  placeholder="search...">
        </form>
        <div class="search-icons">
            <i class="fas fa-search"></i>
            <i class="fas fa-times"></i>
        </div>
    </div>
    <div class="result-list">
        <article v-for="(article,index) in article" :key="index">
            <header>
                <img v-if="article.urlToImage" :src="article.urlToImage" alt="">
                <i class="fas fa-image"></i>
            </header>
            <section v-html="article.title"></section>
            <footer>
                <i class="fas fa-chevron-right"></i>
            </footer>
        </article>

    </div>
  </div>
</template>

<script>
  export default {
    props:  [
        'apiKey'
    ]
    data() => {
        return {
            apiUl:'',
            isBusy: false,
            showloader: false,
            currentPage: 1,
            totalTesults: 0,
            maxPerPage: 20,
            searchword:'',
            articles:[],
            coutrv:'us',
            
        }
    }
    methods: {
        resetData() {
            this.currentPage = 1;
            this.articles = [];
        },
        fetchTopnews() {
            this.apiUl = 'https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=536edac0b8694b6298e1bca491b708a3' + this.country + 
                            '&pageSize=' + this.maxPerPage +
                            '&apiKey=' + this.apiKey;
            this.isBusy = true;
            this.searchword = '';

            this.resetData();
            this.fetchData();
        }
        fetchData(){
            let req = new Request(this.apiUl + '&page=' + this.currentPage);
            fetch(req)
            .then((resp) => resp.json())
            .then((data) => {
                this.totalReslts = data.totalReslts;
                data.articles.forEach(element => {
                    this.articles.push(element);
                });
                this.isBusy = false;
                this.showloader = false;
            })
            .catch((error) =>{
                console.log(error);
            })
        }
    }
    created() {
        this.fetchTopnews();
    }
  }
</script>
<style lang="scss" scoped>
  .containe {
    position: relative;

    .searchbar {
        position:  absolute;
        top: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: 60%;
        font-size: 1.6rem;

        input {
            padding: 0 100px 0 20px;
            margin: 0;
            width: calc(100% - 120px);
            height: 60px;
            border: none;
            font-size: 2rem;
            color: #fff;
            background-color: black;

            &:focus {
                outline: none;
            }
        }

        .search-icons {
            position: absolute;
            right: 20px;
            top: 20px;
            color: #fff;

            i {
                margin-left: 15px;
                cursor: pointer;
            }
        }
    }

    .result-list {
        padding-top: 60px;
    }

    article {
        display: grid;
        grid-template-columns: 200px auto 40px;
        grid-template-rows: 100px;
        border-bottom: 1px solid #ccc;
        overflow: hidden;
        cursor: pointer;

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;

            img {

            }
        }
    }
  }
</style>