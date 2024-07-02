<script setup>
import { RouterLink } from 'vue-router'
</script>

<template>
  <!-- Sidebar Start -->
  <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
          <div
            class="brand-logo d-flex align-items-center justify-content-between"
          >
            <RouterLink to="/dashboard" class="text-nowrap logo-img">
              <img
              src="/src/img/header/logo.png"
                width="100%"
                alt=""
              />
            </RouterLink>
            <div
              class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
              id="sidebarCollapse"
            >
              <i class="ti ti-x fs-8"></i>
            </div>
          </div>
          <!-- Sidebar navigation-->
          <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">Home</span>
              </li>
              <li class="sidebar-item">
                <RouterLink
                  class="sidebar-link"
                  to="/dashboard"
                  aria-expanded="false"
                  >
                  <span>
                    <i class="ti ti-layout-dashboard"></i>
                  </span>
                  <span class="hide-menu">Dashboard</span>
                </RouterLink>
              </li>
              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">UI COMPONENTS</span>
              </li>

              <li class="sidebar-item">
                <RouterLink
                  class="sidebar-link"
                  to="/products"
                  aria-expanded="false"
                >
                  <span class="hide-menu">Card</span>
                </RouterLink>
              </li>
              <li class="sidebar-item">
                <RouterLink
                  class="sidebar-link"
                  to="/forms"
                  aria-expanded="false"
                >
                
                  <span class="hide-menu">Forms</span>
                </RouterLink>
              </li>
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>
      <!--  Sidebar End -->
</template>

<style scoped>
@import "/src/assets/test.css"
</style>