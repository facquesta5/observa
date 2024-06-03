</div>
</div>
<script>
    new Vue({
        el: '#theme-switcher',
        data: {
            themeStylesheet: '<?php echo $baseUrl ?>/public/css/light.css',
            iconClass: 'fas fa-sun',
            cookieTheme: false,
            theme: localStorage.getItem('theme') || 'dark',
            themeStylesheet: localStorage.getItem('themeStylesheet') || '<?php echo $baseUrl ?>/public/css/light.css',
            iconClass: localStorage.getItem('iconClass') || 'fas fa-sun',
        },
        created() {
            this.cookieTheme = this.cookieThemeExists();
        },
        methods: {
            switchTheme() {
                if (this.theme === 'light') {
                    this.theme = 'dark';
                    this.themeStylesheet = '<?php echo $baseUrl ?>/public/css/dark.css';
                    this.iconClass = 'fas fa-moon';
                } else {
                    this.theme = 'light';
                    this.themeStylesheet = '<?php echo $baseUrl ?>/public/css/light.css';
                    this.iconClass = 'fas fa-sun';
                }
                localStorage.setItem('theme', this.theme);
                localStorage.setItem('themeStylesheet', this.themeStylesheet);
                localStorage.setItem('iconClass', this.iconClass);
                document.getElementById('theme-stylesheet').href = this.themeStylesheet;
            },
            cookieThemeExists: function() { //verifica se já existe um cookie
                return document.cookie.indexOf("theme=light") !== -1;
            }
        },
        mounted() {
            document.getElementById('theme-stylesheet').href = this.themeStylesheet;
        }
    });
</script>