<script setup lang="ts">
import { inject, ref } from "vue";
import { pocketBaseSymbol } from "@/symbols/injectionSymbols";
import { useUserStore } from "@/stores/user";
import { useRouter, RouterLink } from "vue-router";

// Inject the PocketBase client
const $pb = inject(pocketBaseSymbol);
// Init the store
const userStore = useUserStore();
// Router composable
const router = useRouter();
// Reactive variables
const email = ref("");
const password = ref("");
const passwordConfirm = ref("");
// Function to create a new user
const createUser = async () => {
  try {
    if (validateInput()) {
      // Create new user
      const user = await $pb?.collection("users").create({
        email: email.value,
        username: "unnamed",
        password: password.value,
        passwordConfirm: passwordConfirm.value,
      });
      if (user) {
        // Authenticate the user in order to set the username
        await authUser();
        // After succesfull user registration, redirect to dashboard
        router.push({ path: "/dashboard" });
      } else {
        console.log("Error");
      }
    } else {
      alert("Password doesn't match");
    }
  } catch (error) {
    console.log("create user error");
    console.log(error);
  }
};
// Function to authenticate the user based on email and password
const authUser = async () => {
  try {
    // Authenticate the user via email and password
    const userData = await $pb
      ?.collection("users")
      .authWithPassword(email.value, password.value);
    if (userData) {
      userStore.userID = userData.record.id;
      userStore.username = userData.record.profile?.username;
      userStore.userProfileID = userData.record.profile?.id;
      router.push({ path: "/dashboard" });
    }
  } catch (error) {
    console.log("auth user error");
    console.log(error);
  }
};
// Simple utility function to validate input. Easiliy extendable with additional checks if needed
const validateInput = () => {
  if (password.value !== passwordConfirm.value) {
    return false;
  } else {
    return true;
  }
};
</script>

<template>
  <div class="login-root">
    <div class="formbg-outer">
      <div class="form">
        <div class="form-inner">
          <RouterLink to="/"> <div class="arrow arrow-left"></div></RouterLink>
          <span class="form-inner__title">Зарегистрируйте аккаунт</span>
          <form id="registration-form" @submit.prevent="createUser">
            <div class="field">
              <label for="email">Email</label>
              <input
                type="email"
                class="email"
                name="email"
                v-model="email"
                required
              />
              <!-- v-model="email" -->
            </div>
            <div class="field">
              <label for="password">Password</label>
              <input
                type="password"
                class="password"
                name="password"
                v-model="password"
                required
              />
              <!-- v-model="password" -->
            </div>
            <div class="field">
              <label for="confirm-password">Confirm Password</label>
              <input
                type="password"
                class="confirmPassword"
                name="confirm-password"
                v-model="passwordConfirm"
                required
              />
            </div>
            <div class="field">
              <button class="btn-form" type="submit" name="submit">
                Sign Up
              </button>
            </div>
          </form>
        </div>
      </div>
      <div class="footer-link">
        <span>
          У вас уже есть аккаунт?
          <RouterLink to="/dashboard">Sign in</RouterLink></span
        >
      </div>
    </div>
  </div>
</template>
<style scoped>
* {
  padding: 0;
  margin: 0;
  color: #1a1f36;
  box-sizing: border-box;
  word-wrap: break-word;
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto,
    Helvetica Neue, Ubuntu, sans-serif;
}
.arrow {
  width: 15px;
  height: 15px;
  border-top: 3.5px solid #556be9;
  border-right: 3.5px solid #556be9;
  margin-right: 60px;
}
.arrow-left {
  transform: rotate(-135deg);
}

h1 {
  letter-spacing: -1px;
}
a {
  color: #556be9;
  text-decoration: unset;
}
.form-outer {
  width: 100%;
}
.form-inner {
  padding: 48px;
}

.form-inner__title {
  text-align: center;
  padding-bottom: 15px;
}
.field-passwords {
  display: grid;
  grid-template-columns: 50% 50%;
  align-items: center;
}
.flex-flex {
  display: flex;
}
.align-center {
  align-items: center;
}

.form {
  margin: 50px auto;
  width: 100%;
  max-width: 448px;
  background: white;
  border-radius: 20px;
  box-shadow: rgba(60, 66, 87, 0.12) 0px 7px 14px 0px,
    rgba(0, 0, 0, 0.12) 0px 3px 6px 0px;
}
span {
  display: block;
  font-size: 20px;
  line-height: 28px;
  color: #1a1f36;
}

label {
  margin-bottom: 10px;
}
.reset-pass a,
label {
  font-size: 14px;
  font-weight: 600;
  display: block;
}
.reset-pass > a {
  text-align: right;
  margin-bottom: 10px;
}

.field {
  padding-bottom: 24px;
}
.btn-form {
  background-color: #273699;
  padding: 8px 18px;
  border: none;
  color: white;
  border-radius: 15px;
  cursor: pointer;
  border: none;
}
.btn-form:hover {
  background-color: #1b2980;
}
.btn-form:active {
  background-color: #0f1b69;
}

.field input {
  font-size: 16px;
  line-height: 28px;
  padding: 8px 16px;
  width: 100%;
  min-height: 44px;
  border: unset;
  border-radius: 4px;
  outline-color: #273699;
  background-color: rgb(255, 255, 255);
  border: 1px solid #5c5c5c5f;
}

input[type="submit"] {
  background-color: rgb(84, 105, 212);
  border: 1px solid #5c5c5c5f;
  color: #fff;
  font-weight: 600;
  cursor: pointer;
}
.field-checkbox input {
  width: 20px;
  height: 15px;
  margin-right: 5px;
  box-shadow: unset;
  min-height: unset;
}
.field-checkbox label {
  display: flex;
  align-items: center;
  margin: 0;
}
a.ssolink {
  display: block;
  text-align: center;
  font-weight: 600;
}
.footer-link span {
  font-size: 14px;
  text-align: center;
}
</style>
