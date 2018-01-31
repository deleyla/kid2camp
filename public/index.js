/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var LoginPage = {
  template: "#index-login-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#index-signup-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};
// ============= //
// SIGN UP PAGES
// ============= //

// // Family-SignUp-Vue.js
var FamilySignupPage = {
  template: "#family-signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      phoneNumber: "",
      streetAddress: "",
      secondaryAddress: "", 
      city: "", 
      state: "",
      zipCode: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        phone_number: this.phoneNumber,
        street_address: this.streetAddress,
        secondary_address: this.secondaryAddress,
        city: this.city,
        state: this.state,
        zip_code: this.zipCode
      };
      axios
        .post("/families", params)
        .then(function(response) {
          router.push("/family-login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// // Camp-SignUp-Vue.js
var CampSignupPage = {
  template: "#camp-signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      phoneNumber: "",
      streetAddress: "",
      secondaryAddress: "", 
      city: "", 
      state: "",
      zipCode: "",
      category: "",
      subCategory: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        phone_number: this.phoneNumber,
        street_address: this.streetAddress,
        secondary_address: this.secondaryAddress,
        city: this.city,
        state: this.state,
        zip_code: this.zipCode,
        category: this.category,
        sub_category: this.subCategory
      };
      axios
        .post("/camps", params)
        .then(function(response) {
          router.push("/camp-login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// // Donor-SignUp-Vue.js
var DonorSignupPage = {
  template: "#donor-signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      phoneNumber: "",
      streetAddress: "",
      secondaryAddress: "", 
      city: "", 
      state: "",
      zipCode: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        phone_number: this.phoneNumber,
        street_address: this.streetAddress,
        secondary_address: this.secondaryAddress,
        city: this.city,
        state: this.state,
        zip_code: this.zipCode
      };
      axios
        .post("/donors", params)
        .then(function(response) {
          router.push("/donor-login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// =========== //
// LOGIN PAGES //
// =========== //

// Family LOGIN page

var FamilyLoginPage = {
  template: "#family-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/family_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var CampLoginPage = {
  template: "#camp-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/camp_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var DonorLoginPage = {
  template: "#donor-login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/donor_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

// ========== //
// CAMP PAGES //
// ========== //

var CampIndexPage = {
  template: "#camp-index-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/login", component: LoginPage },
    { path: "/signup", component: SignupPage },
    { path: "/logout", component: LogoutPage },
    // routes to signup pages
    { path: "/family-signup", component: FamilySignupPage },
    { path: "/camp-signup", component: CampSignupPage },
    { path: "/donor-signup", component: DonorSignupPage },
    // routes to login pages
    { path: "/family-login", component: FamilyLoginPage },
    { path: "/camp-login", component: CampLoginPage },
    { path: "/donor-login", component: DonorLoginPage },
    // routes to camp pages
    { path: "/camps", component: CampIndexPage },
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});