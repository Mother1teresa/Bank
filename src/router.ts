import client from "@/pocketbase";
import { createRouter, createWebHistory } from "vue-router";
const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            meta: { requiresAuth: false },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/HomePage.vue")
        },
        {
            path: "/sign-up",
            name: "sign-up",
            meta: { requiresAuth: false },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/RegistrationPage.vue")
        },
        {
            path: "/sing-in",
            name: "sing-in",
            meta: { requiresAuth: false },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/LoginPage.vue")
        },
        {
            path: "/dashboard",
            name: "dashboard",
            meta: { requiresAuth: true },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/AdminDashboardPage.vue")
        },
        {
            path: "/products",
            name: "products",
            meta: { requiresAuth: true },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/ProductsPage.vue")
        },
        {
            path: "/forms",
            name: "forms",
            meta: { requiresAuth: true },
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("./pages/FormsPage.vue")
        }
    ]
});
router.beforeEach((to, from) => {
    // Init the store within the beforeEach function as per the documentation:
    // https://pinia.vuejs.org/core-concepts/outside-component-usage.html#single-page-applications
    if (to.meta.requiresAuth && !client?.authStore.token) {
        return {
            path: "/sing-in"
        };
    }
});
export default router;