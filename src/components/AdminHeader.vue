
<script setup lang="ts">
import { useUserStore } from "@/stores/user";
import { pocketBaseSymbol } from "@/symbols/injectionSymbols";
import { inject } from "vue";
import { useRouter } from "vue-router";

// Init the store
const userStore = useUserStore();
// Inject the PocketBase client
const $pb = inject(pocketBaseSymbol);
// Router composable
const router = useRouter();
const logoutUser = () => {
    // Manual reset because Pinia using the composition API does not support the $reset function
    userStore.clear();
    // Remove the PocketBase token
    $pb?.authStore.clear();
    // Redirect to the login page
    router.push({ path: "/" });
};
</script>

<template>
  <header class="app-header">
          <nav class="navbar navbar-expand-lg navbar-light">
            <ul class="navbar-nav">
              <li class="nav-item d-block d-xl-none">
                <a
                  class="nav-link sidebartoggler nav-icon-hover"
                  id="headerCollapse"
                  
                >
                  <i class="ti ti-menu-2"></i>
                </a>
              </li>
              <li class="nav-item">
                <RouterLink to="/">
                  <div class="notification">назад</div>
                </RouterLink>
              </li>
            </ul>
            <div
              class="navbar-collapse justify-content-end px-0"
              id="navbarNav"
            >
              <ul
                class="navbar-nav flex-row ms-auto align-items-center justify-content-end"
              >
                <li class="nav-item dropdown">
                  <a
                    class="nav-link nav-icon-hover-befor"
                    id="drop2"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    @click="logoutUser"
                  >
                    <img
                      src="/src/assets/admin/images/profile/user-1.jpg"
                      alt=""
                      width="35"
                      height="35"
                      class="rounded-circle"
                    />
                  </a>
                  <div
                    class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                    aria-labelledby="drop2"
                  >
                   
                  </div>
                </li>
              </ul>
            </div>
          </nav>
        </header>
</template>

<style scoped>
@import "/src/assets/test.css"
</style>