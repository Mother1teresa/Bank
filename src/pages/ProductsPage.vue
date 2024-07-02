<template>
  <!--  Body Wrapper -->
  <div
    class="page-wrapper"
    id="main-wrapper"
    data-layout="vertical"
    data-navbarbg="skin6"
    data-sidebartype="full"
    data-sidebar-position="fixed"
    data-header-position="fixed"
  >
    <!-- Sidebar Start -->
    <AppLeftSidebar />
    <!--  Sidebar End -->

    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <AdminHeader />
      <!--  Header End -->
      <div class="container-fluid">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">
                Дополнительные продукты для бизнеса
              </h5>
              <div class="form-adding-content">
                <h5 class="">
               Добавить контент
              </h5>
             
              <form @submit.prevent>
                <div class="form-content">
                <label for="addtitle" >Добавить название Товара</label>
                <input class="createAddtitle" type="text" name="" id="addtitle" v-on:input="inputChange">

                <label for="addbackgroundcol">Добавить Фон</label>     
                <input class="createAddbackgroundcol" type="text" name="" id="addbackgroundcol">
                            
                <label for="addimg">Добавить фотографию</label>
                <input class="createAddimg" type="text" name="" id="addimg">
              </div>  
                    <button class="save-btn btn-m" @click="createData" type="submit">Добавить</button>
           
              </form>
           
            </div>
              <div class="card-title_item">
              <form class="form" v-for="item in product" :key="item.id" @submit.prevent>
              <div class="main-products">
                <div class="main-product-content">
                    <div class="main-product" :class="item.backgclass">
                        <div class="main-product__title">
                            <label for="title">Названия Товаров</label>
                            <input :id="item.id" class="main-product__title-input" type="text" ref="myInput" v-bind:value="item.productsTitle" v-on:input="inputChange" name="name" required minlength="1" maxlength="55" size="15"/>
                        </div>
                        <img :src="item.productsImage" alt="#" class="pc" />
                    </div>
                    <button class="save-btn btn-m" @click="handleSubmit" type="submit">Сохранить</button>
                    <button class="del-btn btn-m" @click.prevent="deleteProduct(item.id)" type="button">Удалить</button>
                </div> 
            </div>
        </form>
      </div>
              <h5 class="card-title fw-semibold mb-4">Card</h5>
              <div class="card-title_item">
              <form action="" @submit.prevent v-for="item in data" :key="item.id"> 
                <div class="box-col-form">
                <div class="box-col">
                  <div class="box-col__content">
                    <div class="box-col__title">
                      <div class="form-label">
                        <label for="title">Название тарифа</label>
                        <input class="form-title" :value="item.title"  v-on:input="inputChange" type="text" :id="item.id"  name="name" required minlength="4" maxlength="20" size="15"/>
                      </div>
                    </div>
                    <div class="box-col__text">
                      <div class="form-label">
                      <label for="description">Описание</label>
                      <input class="form-description" :value="item.description " type="text" id="description" name="name" required minlength="4" maxlength="255" size="45"/>
                    </div>
                    </div>
                    <div class="col__items">
                      <div class="col__item">
                        <div class="col__title">
                          <div class="form-label">                         
                            <label for="pestitle">%</label>
                            <input class="form-pestitle" :value="item.pestitle" type="text" id="pestitle" name="name" required minlength="4" maxlength="8" size="15"/>
                        </div>
                        </div>
                        <div class="col__text">
                          <label for="pedesc">Описание</label>
                          <input class="form-pedesc" :value="item.pedesc" type="text" id="pedesc" name="name" required minlength="4" maxlength="8" size="15"
                          />
                        </div>
                      </div>
                      <div class="col__item">
                        <div class="col__title">
                          <label for="frtTitle">Обслуживание</label>
                          <input class="form-frtTitle" :value="item.frtTitle" type="text" id="frtTitle" name="name" required minlength="4" maxlength="8" size="15"
                          />
                        </div>
                        <div class="col__text">
                          <label for="frDesc">Описание</label>
                          <input class="form-frDesc" :value="item.frDesc" type="text" id="frDesc" name="name" required minlength="4" maxlength="20" size="25"
                          />
                        </div>
                      </div>
                    </div>
                    <input type="text" :value="item.image">
                    
                  </div>
                  
                
                <button class="form-btn btn-m" @click="cardData" type="submit"  >Сохранить</button>
              </div>
            </div>
              </form>
            </div>
              <h5 class="card-title fw-semibold mb-4">
                Titles, text, and links
              </h5>
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                  <p class="card-text">
                    Some quick example text to build on the card title and make
                    up the bulk of the card's content.
                  </p>
                  <a class="card-link">Card link</a>
                  <a class="card-link">Another link</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import AdminHeader from "@/components/AdminHeader.vue";
import AppLeftSidebar from "@/components/AppLeftSidebar.vue";
</script>
<script>
import axios from "axios";

export default {
  data() {
    return {
      product: [],
      data: [],
      inputOne:'',
      productsTitle:'',
      id:'',
    };
  },
  mounted() {
    this.productsForbusiness();
    this.fetchContent();
  },

  methods: {
    handleSubmit(event){
      
      let targetInput = event.target.parentNode.getElementsByClassName("main-product__title-input")[0];
      console.log(event.target.parentNode)

      axios
        .get('http://adminphp/productsForBusinessUPDATE.php?title='+targetInput.value+'&id='+targetInput.id)
      
        console.log('http://adminphp/productsForBusinessUPDATE.php?title='+targetInput.value+'&id='+targetInput.id);
    },


    inputChange (event){
      console.log('event.target', event.target.value, event.target.id)
      this.productsTitle = event.target
    },
    inputData(event){
      console.log('eveDta',event.target.value, event.target.id)
        this.title = event.target
    },

    deleteProduct(id) {
      axios
        .get('http://adminphp/prodectsForBusinessDELET.php?id='+id)
        .then((response) => {
          this.products = response.data;
          location.reload();
        })
        .catch(error => {
          console.error("Ошибка при удалении продукта: ", error);
        });
    },

    cardData(event){
      let cardTitleInput = event.target.parentNode.getElementsByClassName("form-title")[0];
      let cardDescriptionInput = event.target.parentNode.getElementsByClassName("form-description")[0];
      let cardPestitleInput = event.target.parentNode.getElementsByClassName("form-pestitle")[0];
      let cardPedescInput = event.target.parentNode.getElementsByClassName("form-pedesc")[0];
      let cardFrtTitleInput = event.target.parentNode.getElementsByClassName("form-frtTitle")[0];
      let cardFrDescInput = event.target.parentNode.getElementsByClassName("form-frDesc")[0];
      let get = 'http://adminphp/tariffUPDATE.php?title='+cardTitleInput.value+'&id='+cardTitleInput.id+'&description='+cardDescriptionInput.value+'&pestitle='+cardPestitleInput.value+'&pedesc='+cardPedescInput.value+'&frtTitle='+cardFrtTitleInput.value+'&frDesc='+cardFrDescInput.value;
      console.log(event.target.parentNode)
      axios
      .get(get);
    //   axios
    //   .post('http://adminphp/tariffUPDATE.php') ,{
    //     title: cardTitleInput.value,
    //     id: cardTitleInput.id,
    //     description: cardDescriptionInput.value,
    //     pestitle: cardPestitleInput.value,
    //     pedesc: cardPedescInput.value,
    //     frtTitle: cardFrtTitleInput.value,
    //     frDesc: cardFrDescInput.value,
    // }
    location.reload();
    },

    createData(event){
      let createTitle = event.target.parentNode.getElementsByClassName('createAddtitle')[0]; 
      let createBackground = event.target.parentNode.getElementsByClassName('createAddbackgroundcol')[0];
      let createimage = event.target.parentNode.getElementsByClassName('createAddimg')[0];

      axios
      .get('http://adminphp/productsForBusinessCREATE.php?title='+createTitle.value+'&image='+createimage.value+'&backgclass='+createBackground.value);
      console.log('http://adminphp/productsForBusinessCREATE.php?title='+createTitle.value+'&image='+createimage.value+'&backgclass='+createBackground.value);
    },

    productsForbusiness() {
      axios
        .get("http://adminphp/productsForbusiness.php")

        .then((response) => {
          this.product = response.data;
          // console.log(this.product);
          // this.product;
        })
        .catch((error) => {
          console.error("Ошибка при получении контента:", error);
        });
    },
    fetchContent() {
      axios
        .get("http://adminphp/tariffs.php")

        .then((response) => {
          this.data = response.data;
          // console.log(this.data);
          // this.data;
        })
        .catch((error) => {
          console.error("Ошибка при получении контента:", error);
        });
    },
  },
};
</script>

<style scoped>
.form-adding-content{
  width: 420px;
  border: 1px solid #000;
  padding: 10px;
  border-radius: 15px;
  margin-bottom: 30px;
}
.form-content{
  display: grid;
  gap: 10px;
  color: #4a4a4adf;
  font-size: 14px;
}
.form-content input{
  height: 30px;
  border-radius: 20px;
  width: 400px;
  border-color: #6b6b6b6e;
  font-size: 16px;
  width: 100%;
  padding: 8px;
}
.card-body{
  box-sizing: border-box;
}
.card-title_item{
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  
}
.main-products {
  
  margin: 0;
  padding: 0;
  /* padding-bottom: 50px ; */
}
.main-product {
  border-radius: 36px;
  width: 339px;
  padding: 30px 15px 0 15px;
  text-align: center;
}
.main-product-content{
  display: inline-block;
  gap: 30px;
  
}

.card-title {
  margin-top: 35px;
}
.box-col {
  width: 450px;
  background-color: #eeeff0;
  border: none;
  border-radius: 36px;
  padding: 40px;
}
.box-col-form{
  display: flex;
  flex-wrap: wrap;
  gap: 35px;
}
.form-label{
  display: grid;
}
.form-title{
  width: 250px;
}
.form-description{
  width: 300px;
}
.form-pestitle{
  width: 100px;
}
.main-product__title-input{
  font-size: 16px;
  width: 100%;
  height: 27px;
  border: none;
  padding: 8px;
}

.save-btn, .form-btn{
  padding: 8px;
  background-color: rgba(3, 170, 3, 0.718);
  border: none;
  border-radius: 5px;
  color: beige;
}
.save-btn:hover{
background-color: rgba(3, 153, 3, 0.851);
}
.save-btn:active{
background-color: rgba(2, 128, 2, 0.893);
}
.del-btn{
  background-color: rgba(255, 0, 0, 0.799);
  color: beige;
  padding: 8px;
  border: none;
  border-radius: 5px;
}
.del-btn:hover{
  background-color:rgba(202, 2, 2, 0.893);
}
.del-btn:active{
  background-color:rgba(170, 0, 0, 0.799);
}
.btn-m{
  margin: 15px;
}
  
</style>

<style scoped>
@import "/src/assets/test.css"
</style>