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
              <h5 class="card-title fw-semibold mb-4">Forms</h5>
              <div class="card">
                <div class="card-body">
                  <form>
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label"
                        >Email address</label
                      >
                      <input
                        type="email"
                        class="form-control"
                        id="exampleInputEmail1"
                        aria-describedby="emailHelp"
                      />
                      <div id="emailHelp" class="form-text">
                        We'll never share your email with anyone else.
                      </div>
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label"
                        >Password</label
                      >
                      <input
                        type="password"
                        class="form-control"
                        id="exampleInputPassword1"
                      />
                    </div>
                    <div class="mb-3 form-check">
                      <input
                        type="checkbox"
                        class="form-check-input"
                        id="exampleCheck1"
                      />
                      <label class="form-check-label" for="exampleCheck1"
                        >Check me out</label
                      >
                    </div>
                    <button type="submit" class="btn btn-primary">
                      Submit
                    </button>
                  </form>
                </div>
              </div>
              <h5 class="card-title fw-semibold mb-4">Disabled forms</h5>
              <div class="card mb-0">
                <div class="card-body">
                  <form>
                    <fieldset disabled>
                      <legend>Disabled fieldset example</legend>
                      <div class="mb-3">
                        <label for="disabledTextInput" class="form-label"
                          >Disabled input</label
                        >
                        <input
                          type="text"
                          id="disabledTextInput"
                          class="form-control"
                          placeholder="Disabled input"
                        />
                      </div>
                      <div class="mb-3">
                        <label for="disabledSelect" class="form-label"
                          >Disabled select menu</label
                        >
                        <select id="disabledSelect" class="form-select">
                          <option>Disabled select</option>
                        </select>
                      </div>
                      <div class="mb-3">
                        <div class="form-check">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            id="disabledFieldsetCheck"
                            disabled
                          />
                          <label
                            class="form-check-label"
                            for="disabledFieldsetCheck"
                          >
                            Can't check this
                          </label>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary">
                        Submit
                      </button>
                    </fieldset>
                  </form>
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

<style scoped>
@import "/src/assets/test.css";
</style>
