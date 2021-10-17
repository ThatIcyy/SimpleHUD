<template>
  <div id="app">
    <div class='hud-wrapper'>
      <div class='hud' v-for='status in statuses' :key='status.name'>
        <div class='status'>
          <img :src="'/html/static/img/' + status.icon">
          <div class='statusbar' :style="{height: status.status + '%'}"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'app',
  components: {
  },
  data() {
    return {
      statuses: [
        {name: 'health', status: 0, icon: 'health.svg'},
        {name: 'thirst', status: 0, icon: 'thirst.svg'},
        {name: 'hunger', status: 0, icon: 'hunger.svg'}
      ]
    };
  },
  mounted() {
    window.addEventListener('message', event => {
      const item = event.data
      if (item.event === 'updatestatus') {
        this.updatestatus(item.status, item.value)
      }
    })
  },
  methods: {
    updatestatus(status, value) {
      this.statuses.forEach((data, index) => {
        if (data.name === status) {
          this.statuses[index].status = value
        }
      })
    },
  },
};
</script>

<style lang="scss">
.hud-wrapper {
  display: flex;
  justify-content: center;
  margin-top: 90vh;
}
.hud {

}
.status {
  filter: drop-shadow(0px 3px 20px #CEC171);
  z-index: -1;
  margin-left: 30px;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 5.5vh;
  width: 5.5vh;
  border: 2px #CEC171 solid;
  background: rgba(0, 0, 0, 0.28);
}

.img {
  position: absolute;
  z-index: 2;
}
.status-wrapper {
  display: grid;
  position: absolute;
}
.statusbar {
  width: 5.5vh;
  position: absolute;
  bottom: 0;
  z-index: -1;
  align-self: end;
  background: #CEC171;
}
</style>
