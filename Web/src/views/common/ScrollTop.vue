<template>
  <transition :name="transitionName">
    <div class="back-to-ceiling" @click="backToTop" v-show="visible" :style="customStyle">
      <i class="fa fa-chevron-circle-up"></i>
    </div>
  </transition>
</template>

<script>
export default {
  name: "BackToTop",
  props: {
    visibilityHeight: {
      type: Number,
      default: 400
    },
    backPosition: {
      type: Number,
      default: 0
    },
    customStyle: {
      type: Object,
      default: function() {
        return {
          right: "50px",
          bottom: "50px",
          "font-size": "46px"
        };
      }
    },
    transitionName: {
      type: String,
      default: "fade"
    }
  },
  data() {
    return {
      visible: false,
      interval: null
    };
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  beforeDestroy() {
    window.removeEventListener("scroll", this.handleScroll);
    if (this.interval) {
      clearInterval(this.interval);
    }
  },
  methods: {
    handleScroll() {
      this.visible = window.pageYOffset > this.visibilityHeight;
    },
    backToTop() {
      const start = window.pageYOffset;
      let i = 0;
      this.interval = setInterval(() => {
        const next = Math.floor(this.easeInOutQuad(10 * i, start, -start, 500));
        if (next <= this.backPosition) {
          window.scrollTo(0, this.backPosition);
          clearInterval(this.interval);
        } else {
          window.scrollTo(0, next);
        }
        i++;
      }, 16.7);
    },
    easeInOutQuad(t, b, c, d) {
      if ((t /= d / 2) < 1) return (c / 2) * t * t + b;
      return (-c / 2) * (--t * (t - 2) - 1) + b;
    }
  }
};
</script>

<style scoped>
.back-to-ceiling {
  position: fixed;
  text-align: center;
  cursor: pointer;
  color: #409eff;
  transition: transform 0.5s;
}

.back-to-ceiling:hover {
  transform: rotate(360deg);
}

.fade-enter-active,
.fade-leave-active {
  transition: all 0.5s;
  transform: scale(1) rotate(-1turn) translate(120px);
}

.fade-enter,
.fade-leave-to {
  opacity: 1;
}

.back-to-ceiling .Icon {
  fill: #9aaabf;
  background: none;
}
</style>
