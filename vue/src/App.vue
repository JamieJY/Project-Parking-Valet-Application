<template>
  <div id="capstone-app">
    <div v-if="showUserNav" id="userNav">
      <router-link v-bind:to="{ name: 'slips' }" v-if="$store.state.token">Parking Slips</router-link>&nbsp;|&nbsp;
      <!-- <router-link v-bind:to="{ name: 'home' }" v-show="$route.name !== 'login'">Home</router-link>&nbsp;|&nbsp; -->
      <!-- <router-link v-bind:to="{ name: 'request-pickup' }" v-show="$route.name !== 'login'">Request a Pickup</router-link>&nbsp;|&nbsp; -->
      <router-link v-bind:to="{ name: 'CustomerParkingAvailability'}" v-show="$route.name !== 'login'">Lot Availability</router-link>&nbsp;|&nbsp;
     
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token">Logout</router-link>&nbsp;
    </div>
    <div v-if = "showAdminNav" id="AdminNav">
      <router-link v-bind:to="{ name: 'home' }" v-show="$route.name !== 'login'">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'check-in' }" v-if="$store.state.token">Check In</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'lot-availability'}" v-show="$route.name !== 'login'">Lot Availability</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'ParkedCars' }">Car Details</router-link> &nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'slips' }" v-if="$store.state.token">Parking Slips</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<script>
// import { Store } from 'vuex';

export default {
  computed: {
    showArrivalTime() {
      return this.$route.name !== 'login';
    },

    showUserNav(){
      console.log(this.$store.state)
      if(this.$store.state){
        if (this.$store.state.user && this.$store.state.token !== ""){
        return this.$store.state.user.authorities[0].name === 'ROLE_USER'
      }
      }
        return false;
    },
    showAdminNav(){
      if(this.$store.state){
      if(this.$store.state.user && this.$store.state.token !== ""){
        return this.$store.state.user.authorities[0].name === 'ROLE_VALET'
      }
    }
      return false;
    }
  }
}

</script>
<style>


</style>
