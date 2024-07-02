<script setup>
import { RouterLink } from 'vue-router'
</script>

<script>
export default {
  methods: {
    scrollToElement() {
      const element = document.getElementById("target-element");
      if (element) {
        element.scrollIntoView({ behavior: "smooth", block: "start" });
      }
    },
  },
};
</script>

<template>
  <header>
    <div class="page-header">
      <div class="main-menu">
        <div class="logo">
          <img src="/src/img/header/logo.png" alt="" />
        </div>
        <!-- <a href="#/components/123">text</a> -->
        <div class="main-menu__profil">
          <RouterLink to="/dashboard">
            <img
              class="profil"
              src="/src/img/header/profil.png"
              alt=""
              width="30px"
              height="30px"
          />
          </RouterLink>
          <button v-on:click="scrollToElement" class="btn-blue">
            Получить консультацию
          </button>
        </div>
      </div>
    </div>
  </header>
</template>

<style scoped>
header{
  overflow: hidden;
}
.logo {
  width: 230px;
  height: 80px;
}
.page-header {
  padding: 0 15px;
  background-color: #eeeff0;
}
header {
  position: sticky;
  top: 0;
  z-index: 1;
  background-color: white;
}

.btn-blue {
  background-color: #354bca;
  border-radius: 16px;
  border: none;
  /* width: 151px;
  height: 48px; */
  padding: 16px;
  color: white;
}
.btn-blue:focus {
  outline: none;
}
.btn-blue:hover {
  background-color: #273699;
  cursor: pointer;
}

.main-menu {
  height: 86px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.main-menu__profil {
  display: inline-flex;
  align-items: center;
  gap: 15px;
}
.profil {
  display: flex;
}
@media screen and (max-width: 1389px) {
  .container {
    max-width: 1300px;
    width: 100%;
    overflow: hidden;
  }
  .logo {
    display: flex;
    align-items: center;
  }
}
@media screen and (max-width: 979px) {
  .container {
    max-width: 880px;
    margin: 0;
    padding: 15px;
    overflow: hidden;
  }
  .logo{
    width: 200px;
    height: 75px;
  }
  header {
    width: 101%;
  }
}
@media screen and (max-width:785px) {
  header {
    width: 100%;
  }
  .page-header{
    width: 100%;
  }
  .main-menu{
    justify-content: space-around;
  }
}
</style>
