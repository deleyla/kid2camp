/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
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
          router.push("/family-dashboard");
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
          router.push("/scholarship");
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
// INDEX PAGES //
// ========== //

// ADD A REDIRECT PAGE TO THE APPLICATION SUBMIT FUNCTION 

var CampIndexPage = {
  template: "#camp-index-page",
  data: function() {
    return {
      camps: [],
      errors: []
    };
  },
  created: function() {
    console.log("in camp index");
    //make http request to camps route in backend
    axios.get('/camps').then(function(response) {
      console.log(response.data);
      this.camps = response.data;
    }.bind(this));
  },
  methods: {
    submit: function(inputCamp) {
      var params = {
        camp_id: inputCamp.id
      };
      axios
        .post("/camp_applications", params)
        .then(function(response) {
          router.push("/family-dashboard"); 
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var FamilyIndexPage = {
  template: "#family-index-page",
  data: function() {
    return {
      families: [],
      errors: []
    };
  },
  created: function() {
    console.log("in family index");
    //make http request to families route in backend
    axios.get('/families').then(function(response) {
      console.log(response.data);
      this.families = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var DonorIndexPage = {
  template: "#donor-index-page",
  data: function() {
    return {
      donors: [],
      errors: []
    };
  },
  created: function() {
    console.log("in donor index");
    //make http request to donors route in backend
    axios.get('/donors').then(function(response) {
      console.log(response.data);
      this.donors = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

// ================ //
// APPLICATION PAGE //
// ================ //

// // Application-Page-Vue.js
var ApplicationPage = {
  template: "#application-page",
  data: function() {
    return {
      childCount: "",
      adultCount: "",
      householdIncomeType: "",
      grossMonthlyIncome: "",
      netMonthlyIncome: "",
      monthlyHousingCost: "",
      monthlyUtilityCost: "", 
      monthlyMedicalCost: "", 
      monthlyTransportationCost: "",
      monthlyFoodCost: "",
      scholarshipNeedExplanation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        child_count: this.childCount,
        adult_count: this.adultCount,
        household_income_type: this.householdIncomeType,
        gross_monthly_income: this.grossMonthlyIncome,
        net_monthly_income: this.netMonthlyIncome,
        monthly_housing_cost: this.monthlyHousingCost,
        monthly_utility_cost: this.monthlyUtilityCost,
        monthly_medical_cost: this.monthlyMedicalCost,
        monthly_transportation_cost: this.monthlyTransportationCost,
        monthly_food_cost: this.monthlyFoodCost,
        scholarship_need_explanation: this.scholarshipNeedExplanation
      };
      axios
        .post("/applications", params)
        .then(function(response) {
          router.push("/family-dashboard");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// ==========================
// SHOW APPLICATION COMPONENT
// ==========================

var MyApplication = {
  template: "#my-application-page",
  data: function() {
    return {
      familyApplication: []
    };
  },
  created: function() {
    axios.get('/applications/:id').then(function(response) {
      this.familyApplication = response.data;
      console.log(this.familyApplication);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

// ================ //
// CHILDREN PAGE //
// ================ //

// CHILD PAGE //
var ChildrenPage = {
  template: "#children-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      sex: "",
      birthday: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        sex: this.sex,
        birthday: this.birthday
      };
      axios
        .post("/children", params)
        .then(function(response) {
          router.push("/family-dashboard");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// ======================= //
// SHOW CHILDREN COMPONENT //
// ======================= //

var MyChildren = {
  template: "#my-children-page",
  data: function() {
    return {
      myChildren: []
    };
  },
  created: function() {
    axios.get('/children/show').then(function(response) {
      this.myChildren = response.data;
      console.log(this.myChildren);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

// ================ //
// SCHOLARSHIP PAGE //
// ================ //

var ScholarshipPage = {
  template: "#scholarship-page",
  data: function() {
    return {
      amount: "",
      frequency: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        amount: this.amount,
        frequency: this.frequency
      };
      axios
        .post("/scholarships", params)
        .then(function(response) {
          router.push("/camps");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// ========================== //
// SHOW SCHOLARSHIP COMPONENT //
// ========================== //

var MyScholarships = {
  template: "#my-scholarship-page",
  data: function() {
    return {
      myScholarships: []
    };
  },
  created: function() {
    axios.get('/scholarships').then(function(response) {
      this.myScholarships = response.data;
      console.log(this.myScholarships);
    }.bind(this));
  },
  methods: {},
  computed: {}
};


// ========================== //
// SHOW DONATIONS COMPONENT //
// ========================== //

var MyDonations = {
  template: "#my-donations-page",
  data: function() {
    return {
      myDonations: []
    };
  },
  created: function() {
    axios.get('/donations').then(function(response) {
      this.myDonations = response.data;
      console.log(this.myDonations);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

// =============== //
// DASHBOARD PAGES //
// =============== //

var FamilyDashboardPage = {
  template: "#family-dashboard-page",
  data: function() {
    return {
      camp_applications: [],
      errors: []
    };
  },
  created: function() {
    console.log("in camp applications");
    //make http request to camp applications route in backend
    axios.get('/camp_applications/show').then(function(response) {
      console.log(response.data);
      this.camp_applications = response.data;
    }.bind(this));
  },
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
    // routes to index pages
    { path: "/camps", component: CampIndexPage },
    { path: "/families", component: FamilyIndexPage },
    { path: "/donors", component: DonorIndexPage },
    // route to application pages
    { path: "/application", component: ApplicationPage },
    { path: "/myApplication", component: MyApplication },
    // route to child page
    { path: "/children", component: ChildrenPage },
    { path: "/myChildren", component: MyChildren },
    // routes to dashboard pages
    { path: "/family-dashboard", component: FamilyDashboardPage},
    // route to scholarship page
    { path: "/scholarship", component: ScholarshipPage},
    { path: "/myScholarships", component: MyScholarships},
    // route to donations pages
    { path: "/myDonations", component: MyDonations},
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