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
        <div class="col-lg-8 d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-body p-4">
              <h5 class="card-title fw-semibold mb-4">Registered Accounts</h5>
              <div class="table-responsive">
                <table class="table text-nowrap mb-0 align-middle">
                  <thead class="text-dark fs-4">
                    <tr>
                      <th class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">Id</h6>
                      </th>
                      <th class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">Login</h6>
                      </th>
                      <th class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">Password</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">1</h6>
                      </td>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-1">Sunil Joshi</h6>
                      </td>
                      <td class="border-bottom-0">
                        <p class="mb-0 fw-normal">543erfno2s</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">2</h6>
                      </td>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-1">Andrew McDownland</h6>
                      </td>
                      <td class="border-bottom-0">
                        <p class="mb-0 fw-normal">dglm2340df</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">3</h6>
                      </td>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-1">Christopher Jamil</h6>
                      </td>
                      <td class="border-bottom-0">
                        <p class="mb-0 fw-normal">sdfuwnsp01</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-0">4</h6>
                      </td>
                      <td class="border-bottom-0">
                        <h6 class="fw-semibold mb-1">Nirav Joshi</h6>
                      </td>
                      <td class="border-bottom-0">
                        <p class="mb-0 fw-normal">nir34jns</p>
                      </td>
                    </tr>
                  </tbody>
                </table>
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

<style scoped>
@import "/src/assets/test.css";
</style>
