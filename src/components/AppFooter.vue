<script setup></script>

<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-box">
        <div class="footer-box-content">
          <div class="logo">
            <img
              class="logo-image"
              src="/src/img/footer/logo-purple.png"
              alt=""
            />
          </div>
          <div class="box-contact">
            <div class="box-contact__mob">
              <div class="mod-text">Звонок с мобильного бесплатный</div>
              <div class="mod-tel">
                <span>
                  <img
                    src="/src/img/main/trac.png"
                    alt=""
                    width="26px"
                    height="26px"
                /></span >
                2518
                <span
                  ><img
                    src="/src/img/main/tel.png"
                    alt=""
                    width="26px"
                    height="26px"
                /></span>
              </div>
            </div>
          </div>
          <div class="box-contact__call">
            <div class="mod-text">Звонок с мобильного бесплатный</div>
            <a href="tel" class="mod-tel">8 800 555-25-18</a>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="footer-content">
          <div class="col-6">
            <div class="footer-text">
              © 1993–2024 КБ «Кубань Кредит» ООО Генеральная лицензия на
              осуществление банковских операций № 2518 банка России от 3 июля
              2012 года
            </div>
          </div>
          <div class="col-6">
            <div class="footer-text">
              КБ «Кубань Кредит» ООО использует файлы cookie с целью улучшения
              сервисов и повышения удобства пользования сайтом
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<style>
footer{
  overflow: hidden;
}
html {
  background-color: #eeeff0;
}
.footer {
  position: relative;
  font-family: "Stem-SemiLight";
  padding-top: 48px;
  background-color: #eeeff0;
}
.footer-box {
  margin: 0 18px 0 18px;
  height: 236px;
  background-color: #354bca;
  border: none;
  border-radius: 36px;
}
.box-contact {
  color: white;
}
.footer-box-content {
  display: flex;
  gap: 134px;
  align-items: center;
  height: 236px;
  padding-left: 52px;
}
.mod-text {
  font-size: 13px;
  color: rgba(255, 255, 255, 0.5);
}
.mod-tel {
  font-size: 36px;
  color: white;
  font-weight: 600;
  text-decoration: none;
}
.footer-content {
  display: flex;
  gap: 30px;
  margin: 0 auto;
}
.footer-text {
  font-family: "Stem-SemiLight";
  width: 550px;
  height: 30px;
  margin-top: 16px;
  font-size: 10px;
  color: #5c5c5c;
}
@media screen and (max-width: 1389px) {
  .container {
    max-width: 1200px;
  }
}
@media screen and (max-width: 1130px) {
  .logo-image {
    width: 180px;
  }
  .mod-tel {
    font-size: 28px;
  }
  .footer-text {
    width: 400px;
  }
}
@media screen and (max-width:979px) {
  .footer-box .footer-box-content {
    gap: 80px;
    display: flex;
  }
  .logo-image{
    width: 160px;
  }
}
@media screen and (max-width:830px){
  .footer-box .footer-box-content {
    gap: 45px;
    display: flex;
  }
  .logo-image{
    width: 140px;
  }
}
@media screen and (max-width: 769px){
  .footer-box .footer-box-content {
    gap: 40px;
    display: flex;
  }
  .mod-tel{
    font-size: 22px;
  }
  .logo-image{
    width: 120px;
  }
  .footer-text{
    width: 300px;
    height: 40px;
    font-size: 8px;
  }
  .footer-content{
    display: flex;
    gap: 2px;
  }
}
</style>
