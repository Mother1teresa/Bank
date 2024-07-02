<script setup>
import AppHeader from "@/components/AppHeader.vue";
import AppFooter from "@/components/AppFooter.vue";
</script>

<script>
import axios from "axios";

export default {
  //name: "mainItim",

  data() {
    return {
      data: [],
      product: [],
      INfo: [],
      showModal: false,
      submitted: false,
      selectedTab: "billing",
      tabs: {
        billing: {
          backgroundColor: "white",
          color: "black",
          display: "inline-block",
        },
        shipping: {
          backgroundColor: "#2c2c2c12",
          color: "black",
          display: "none",
        },
      },
    };
  },
  mounted() {
    this.fetchContent();
    this.productsForbusiness();
    this.UsefulINformation();
  },
  methods: {
    fetchContent() {
      axios
        .get("http://adminphp/tariffs.php")

        .then((response) => {
          this.data = response.data;
          console.log(this.data);
          this.data;
        })
        .catch((error) => {
          console.error("Ошибка при получении контента:", error);
        });
    },
    productsForbusiness() {
      axios
        .get("http://adminphp/productsForbusiness.php")

        .then((response) => {
          this.product = response.data;
          console.log(this.product);
          this.product;
        })
        .catch((error) => {
          console.error("Ошибка при получении контента:", error);
        });
    },
    UsefulINformation() {
      axios
        .get("http://adminphp/UsefulINformation.php")

        .then((response) => {
          this.INfo = response.data;
          console.log(this.INfo);
          this.INfo;
        })
        .catch((error) => {
          console.error("Ошибка при получении контента:", error);
        });
    },

    

    submitForm() {
      this.submitted = true; // Показать сообщение после отправки
    },

    closeModal() {
      this.showModal = false;
      this.submitted = false; // Сбросить состояние формы при закрытии модального окна
    },
    selectTab(tab) {
      for (let key in this.tabs) {
        this.tabs[key].backgroundColor = "#2c2c2c12";
        this.tabs[key].color = "black";
        this.tabs[key].display = "none";
      }

      this.tabs[tab].backgroundColor = "white";
      this.tabs[tab].color = "black";
      this.selectedTab = tab;
      this.tabs[tab].display = "inline-block";
    },
  },
};
</script>

<template>
  <AppHeader />

  <div class="page-header">
    <div class="container">
      <div class="row">
        <div class="col-6">
          <h1 class="header-main__title">Расчётно-кассовое обслуживание</h1>
          <div class="header-main__text">
            Услуги для бизнеса: от хранения денежных средств до оплаты налогов
          </div>
        </div>
        <div class="col-6">
          <div class="header-main__image">
            <img src="/src/img/main/headerimage.jpg" alt="" />
          </div>
        </div>
      </div>
    </div>
  </div>
  <main class="main">
    <div class="main-box-white">
      <div class="container">
        <div class="container-advantages">
          <div class="container-advantage">
            <div class="advantages">
              <img
                class="advantages__image"
                src="/src/img/main/card.jpg"
                alt=""
              />
              <div class="advantages__text">
                <div class="advantages__title">Бесплатно</div>
                <div class="advantages__subtitle">открытие счета</div>
              </div>
            </div>
            <div class="advantages">
              <img
                class="advantages__image"
                src="/src/img/main/currency.jpg"
                alt=""
              />
              <div class="advantages__text">
                <div class="advantages__title">от 0 ₽</div>
                <div class="advantages__subtitle">ведение счета</div>
              </div>
            </div>
          </div>
          <div class="container-advantage">
            <div class="advantages">
              <img
                class="advantages__image"
                src="/src/img/main/term.jpg"
                alt=""
              />
              <div class="advantages__text">
                <div class="advantages__title">Бессрочный</div>
                <div class="advantages__subtitle">срок действия счета</div>
              </div>
            </div>
            <div class="advantages">
              <img
                class="advantages__image"
                src="/src/img/main/business.jpg"
                alt=""
              />
              <div class="advantages__text">
                <div class="advantages__title">Бесплатно</div>
                <div class="advantages__subtitle">регистрация бизнеса</div>
              </div>
            </div>
          </div>
        </div>
        <div class="main-banner">
          <img
            class="main-banner__image"
            src="/src/img/main/banner-image.png"
            alt=""
          />
          <div class="banner__text">
            <div class="banner__title">Если у вас ещё нет бизнеса</div>
            <div class="banner-text">
              Поможем зарегистрировать бизнес онлайн и откроем расчётный счёт
              после регистрации за одно посещение офиса банка - быстро и
              бесплатно
            </div>
          </div>
          <button @click="showModal = true" class="btn-white">Открыть</button>
        </div>
        <div v-if="showModal" class="modal">
          <div class="modal-content">
            <!-- Кнопка закрытия модального окна -->
            <span class="close" @click="closeModal">&times;</span>
            <!-- Форма записи на консультацию -->
            <form
              v-if="!submitted"
              @submit.prevent="submitForm"
              class="form__input-box"
            >
              <div class="box-main__title">Оставьте заявку на консультацию</div>
              <input class="input_box" type="number" placeholder="ИНН" id="unn" name="unn" minlength="12" maxlength="12" required
              />

              <input class="input_box" type="email" placeholder="Наименование компании" id="name_company" name="email" required
              />

              <input class="input_box" id="name" placeholder="ФИО" name="name" required
              />

              <input class="input_box" type="number" id="tel" placeholder="Телефон" name="tel" minlength="8" maxlength="9" required
              />

              <div class="main-applications-send">
                <div class="main-applications-document">
                  При нажатии на кнопку вы соглашаетесь с
                  <span style="text-decoration: dashed"
                    >условиями обработки и использования персональных
                    данных</span
                  >
                </div>
                <button class="btn-blue" type="submit">Оставить заявку</button>
              </div>
            </form>
            <!-- Сообщение после отправки формы -->
            <div v-if="submitted" class="thank-you-message">
              <div class="check">
                <img src="/src/img/main/check.png" alt="" width="150px" height="150px"
                />
              </div>
              <div class="gratitude">Спасибо!</div>
              <div class="gratitude-text">
                Вы успешно оформили заявку на открытие счёта. Мы свяжемся с вами
                в ближайшее время.
              </div>
            </div>
          </div>
        </div>
        <div class="box-main">
          <div class="box-main__title">Подобрать пакет РКО</div>
          <div class="">
            <div class="row">
              <div class="col-6">
                <form class="form__input-box">
                  <div class="form__title">
                    Платежи клиентам других банков, в месяц
                  </div>
                  <input class="input_box" type="number" placeholder="50 шт" id="payments" name="payments"  minlength="1"  required
                  />
                  <div class="result">0 шт</div>
                  <div class="form__title">Внесение наличных в месяц, ₽</div>
                  <input class="input_box"  minlength="1"   type="number" placeholder="7 750 000" id="insert" name="insert" required
                  />
                  <div class="result">0 ₽</div>
                  <div class="form__title">Снятие наличных в месяц, ₽</div>
                  <input class="input_box" type="numder" minlength="1"  id="takeoff" placeholder="1 750 000" name="takeoff" required
                  />
                  <div class="result">0 ₽</div>
                </form>
              </div>
              <!-- <div class="col-6"> -->
              <div class="box-col">
                <div class="box-col__content">
                  <div class="box-col__title">Эксперт</div>
                  <div class="box-col__text">
                    Тариф без лишних условий — эквайринг 1% вне зависимости от
                    вида деятельности
                  </div>
                  <div class="col__items">
                    <div class="col__item">
                      <div class="col__title">от 1% от суммы</div>
                      <div class="col__text">
                        комиссия
                        <div></div>
                        за зачисление на счёт
                      </div>
                    </div>
                    <div class="col__item">
                      <div class="col__title">Бесплатно</div>
                      <div class="col__text">
                        переводы физлицам — бесплатно до 1 млн ₽
                      </div>
                    </div>
                  </div>
                  <img class="box-image" src="/src/img/main/bg.png" alt="" />
                </div>
                <div class="box-col__button">
                  <button @click="showModal = true" class="btn-blue">
                    Открыть счёт
                  </button>
                </div>
              </div>
              <!-- </div> -->
            </div>
          </div>
        </div>
        <div class="box-tariffs">
          <div class="box-tafiffs-title">
            <div class="box-main__title">Тарифы</div>
            <div class="box-title-button">
              <button
                class="btn-gray"
                @click="selectTab('billing')"
                :style="{
                  backgroundColor: tabs.billing.backgroundColor,
                  color: tabs.billing.color,
                }"
              >
                Плитка
              </button>
              <button
                class="btn-gray"
                @click="selectTab('shipping')"
                :style="{
                  backgroundColor: tabs.shipping.backgroundColor,
                  color: tabs.shipping.color,
                }"
              >
                Таблица
              </button>
            </div>
          </div>

          <div
            class="main-title"
            v-if="selectedTab === 'billing'"
            :style="{ display: tabs.billing.display }"
          >
            <div class="box-main__items">
              <div class="row-box">
                <div class="box-col" v-for="item in data" :key="item.id">
                  <div class="box-col__content">
                    <div class="box-col__title">{{ item.title }}</div>
                    <div class="box-col__text">
                      {{ item.description }}
                    </div>
                    <div class="col__items">
                      <div class="col__item">
                        <div class="col__title">{{ item.pestitle }}</div>
                        <div class="col__text">{{ item.pedesc }}</div>
                      </div>
                      <div class="col__item">
                        <div class="col__title">{{ item.frtTitle }}</div>
                        <div class="col__text">
                          {{ item.frDesc }}
                        </div>
                      </div>
                    </div>
                    <img class="box-image" :src="item.image" alt="#" />
                  </div>
                  <div class="box-col__button">
                    <button @click="showModal = true" class="btn-blue">
                      Открыть счёт
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div
            class="main-table"
            v-if="selectedTab === 'shipping'"
            :style="{ display: tabs.shipping.display }"
          >
            <div class="main-table__boxs">
              <div class="main-table__box" v-for="item in data" :key="item.id">
                <div class="table__box">
                  <div class="table-box__title">{{ item.title }}</div>
                  <div class="table-box__money">{{ item.pestitle }}</div>
                </div>
                <div class="table-box__content">
                  <div class="content-block">
                    <div class="content-block__explanation">
                      {{ item.prtitle }}
                    </div>
                    <div class="content-block__title">
                      {{ item.prdesc }}
                    </div>
                    <div class="content-block__text">
                      {{ item.prText }}
                    </div>
                  </div>
                  <div class="br"></div>
                  <div class="content-block">
                    <div class="content-block__explanation">
                      {{ item.paTitle }}
                    </div>
                    <div class="content-block__title">
                      {{ item.paDes }}
                    </div>
                    <div class="content-block__text">{{ item.paText }}</div>
                  </div>
                  <div class="br"></div>
                  <div class="content-block">
                    <div class="content-block__explanation">
                      {{ item.caDeTitle }}
                    </div>
                    <div class="content-block__title">{{ item.caDesc }}</div>
                    <div class="content-block__text">
                      {{ item.caDeText }}
                    </div>
                  </div>
                  <div class="br"></div>
                  <div class="content-block">
                    <div class="content-block__explanation">
                      {{ item.caWTille }}
                    </div>
                    <div class="content-block__title">
                      {{ item.caWDesc }}
                    </div>
                    <div class="content-block__text">
                      {{ item.caWText }}
                    </div>
                  </div>
                  <div class="br"></div>
                  <div class="content-block">
                    <div class="content-block__explanation">
                      {{ item.posTitle }}
                    </div>
                    <div class="content-block__title">
                      {{ item.posDesc }}
                    </div>
                  </div>
                  <div class="box-col__button">
                    <button @click="showModal = true" class="btn-blue">
                      Открыть счёт
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-steps">
          <div class="box-main__title">Открыть счёт для бизнеса просто</div>
          <div class="box-steps__items">
            <div class="box-steps__item">
              <div class="box-numder">1</div>
              <div class="box-steps-item__text">
                <div class="box-steps__title">Заявка</div>
                <div class="box-steps__text">
                  Проконсультируем по документам, договоримся о встрече
                </div>
              </div>
            </div>
            <div class="box-steps__item">
              <div class="box-numder">2</div>
              <div class="box-steps-item__text">
                <div class="box-steps__title">Встреча</div>
                <div class="box-steps__text">
                  Подпишите документы на встрече
                </div>
              </div>
            </div>
            <div class="box-steps__item">
              <div class="box-numder">3</div>
              <div class="box-steps-item__text">
                <div class="box-steps__title">Готово</div>
                <div class="box-steps__text">Можно пользоваться счётом</div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-banner">
          <div class="row">
            <div class="col-6">
              <div class="box-banner__content">
                <div class="box-banner__content-title">
                  <div class="box-banner__title">
                    Получите реквизиты уже сегодня
                  </div>
                  <div class="box-banner-text">
                    Откроем счёт для ООО/ИП без комиссии за заверение документов
                  </div>
                </div>
                <div class="box-col__button">
                  <button @click="showModal = true" class="btn-white">
                    Открыть счёт
                  </button>
                </div>
              </div>
            </div>
            <div class="col-6">
              <img
                class="translation"
                src="/src/img/main/translation.png"
                alt=""
              />
            </div>
          </div>
        </div>
        <div class="box-steps">
          <div class="box-main__title">РКО в Кубань Кредит</div>
          <div class="box-steps__items">
            <div class="box-steps__item">
              <div class="box-steps-item__text">
                <div class="box-steps__title">Выгодно</div>
                <div class="box-steps__text">
                  Повышенный лимит выдачи денежных средств по корпоративным
                  картам
                </div>
              </div>
            </div>
            <div class="box-steps__item">
              <div class="box-steps-item__text">
                <div class="box-steps__title">24/7</div>
                <div class="box-steps__text">
                  Осуществление конверсионных операций по текущим котировкам
                  Московской биржи в режиме 24/7 с помощью системы ДБО без
                  звонков в банк
                </div>
              </div>
            </div>
            <div class="box-steps__item">
              <div class="box-steps-item__text">
                <div class="box-steps__title">Всегда на связи</div>
                <div class="box-steps__text">
                  СМС-уведомления контрагентам об отправке платежей в их адрес
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="rach-banner">
          <div class="row">
            <div class="col-9">
              <div class="rach-banner__content">
                <div class="rach-banner__content-title">
                  <div class="rach-banner__title">
                    Расчётный счёт в иностранной валюте
                  </div>
                  <div class="rach-banner-text">
                    Всё для работы с валютой на международном рынке
                  </div>
                </div>
              </div>
            </div>
            <div class="col-3">
              <div class="rach-banner__button">
                <button @click="showModal = true" class="btn-white">
                  Открыть ВЭД
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="main-products">
          <div class="box-main__title">Дополнительные продукты для бизнеса</div>
          <div class="main-product-content">
            <div class="main-product" :class="item.backgclass"  v-for="item in product" :key="item.id">
              <div class="main-product__title">
                {{ item.productsTitle }}
              </div>
              <img :src="item.productsImage" alt="#" class="pc" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="box-main-applications"></div>
    <div class="main-applications-content" id="target-element">
      <div class="box-main__title">Оставьте заявку на консультацию</div>
      <div class="main-applications-buttons">
        <!-- main-applications-button -->
        <button class="button" id="appduplicate">Открыть расчётный счёт</button>
        <button class="main-applications-button" id="applications">
          Зарегистрировать бизнес и открыть РКО
        </button>
      </div>
      <form action="" class="form-input">
        <input class="input_person" type="text" placeholder="ФИО" required />
        <input
          class="input_person"
          type="number"
          minlength="8"
          maxlength="16"
          name=""
          id=""
          placeholder="Телефон"
          required
        />
      </form>
      <div class="main-applications-send">
        <div class="main-applications-document">
          При нажатии на кнопку вы соглашаетесь с
          <span style="text-decoration: dashed"
            >условиями обработки и использования персональных данных</span
          >
        </div>
        <button class="btn-white">Оставить заявку</button>
      </div>
    </div>
    <div class="main-about">
      <div class="main-box-white">
        <div class="container">
          <div class="main-about__title-text">
            <div class="main-about__title">
              Сегодня «Кубань Кредит» – крупнейший самостоятельный банк в ЮФО и
              СКФО
            </div>
            <div class="main-about__text">
              За <span style="color: #273699">30 лет</span> была не только
              расширена география банка, но и разработаны качественные
              банковские продукты для частных клиентов и бизнеса
            </div>
          </div>
          <div class="main-about-box__items">
            <div class="main-about-box__item">
              <div class="main-about-box">
                <div class="main-about-box__title">›38К</div>
                <img src="/src/img/main/ellipse.png" alt="" class="ellipse" />
                <div class="main-about-box__text">корпоративных клиентов</div>
              </div>
            </div>
            <div class="main-about-box__item">
              <div class="main-about-box">
                <div class="main-about-box__title">›380К</div>
                <img src="/src/img/main/ellipse.png" alt="" class="ellipse" />
                <div class="main-about-box__text">розничных клиентов</div>
              </div>
            </div>
            <div class="main-about-box__item">
              <div class="main-about-box">
                <div class="main-about-box__title">›500</div>
                <img src="/src/img/main/ellipse.png" alt="" class="ellipse" />
                <div class="main-about-box__text">private клиентов</div>
              </div>
            </div>
            <div class="main-about-box__item">
              <div class="main-about-box">
                <div class="main-about-box__title">›10К</div>
                <img src="/src/img/main/ellipse.png" alt="" class="ellipse" />
                <div class="main-about-box__text">сотрудников</div>
              </div>
            </div>
          </div>
          <div class="main-box-info">
            <div class="main-box">
              <div class="main-info__title">Полезная информация</div>
              <div class="main-info__button--switching">
                <div class="info-activ main-info__button">Общие данные</div>
                <div class="main-info__button">Начисление процентов</div>
                <div class="main-info__button">Требования к клиенту</div>
                <div class="main-info__button">Документы</div>
              </div>
            </div>
            <div class="box-info-line">
              <div :class="key == 0 ?'info-line-one':'info-line-two'" v-for="(item,key) in INfo" :key="item.id">
                <div class="row">
                  <div class="col-5">
                    <div class="info-line__title">
                      {{ item.title }}
                    </div>
                  </div>
                  <div class="col-7">
                    <div class="info-line__text">
                      {{ item.description }}
                    </div>
                  </div>
                </div>
              </div>
              

              <div class="btn-gray">Показать ещё</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <AppFooter />
</template>

<style scoped>
.main-product {
  border-radius: 36px;
  width: 450px;
  padding: 40px 28px 0 28px;
  display: grid;
  text-align: center;
  position: relative;
}
main {
  overflow: hidden;
}
.container-advantage {
  display: flex;
}
.box-info-line {
  overflow: hidden;
}
.box-col {
  overflow: hidden;
}
.box-col {
  width: 600px;
  background-color: #eeeff0;
  border: none;
  border-radius: 36px;
  padding: 40px;
}
@media screen and (max-width: 1389px) {
  .container {
    max-width: 1300px;
    padding: 0 15px;
    overflow: hidden;
  }
  /* .banner__ */
  .banner__title {
    font-size: 30px;
  }
  .banner-text {
    font-size: 13px;
  }
  .main-banner__image {
    width: 370px;
  }
  .main-box-white {
    width: 100%;
    overflow: hidden;
  }
  /* .main .container {
    max-width: 1300px;
    padding: 0 15px;
  } */
  .header-main__title {
    font-size: 55px;
    margin-top: 80px;
    margin-bottom: 16px;
  }
  .header-main__text {
    font-size: 14px;
  }
  .col-6 {
    flex: 0 0 50%;
    max-width: 100%;
  }
  .col-6 .header-main__image {
    width: 100%;
    height: auto;
    display: grid;
    justify-content: center;
  }
  .container-advantages {
    display: grid;
    grid-template-columns: 40% 40%;
    padding-top: 32px;
    justify-content: center;
  }
  .container-advantage {
    display: grid;
    gap: 30px;
    margin: 0 auto;
  }
  .advantages {
    width: 100%;
  }
  .advantages__image {
    width: 100px;
    height: 100px;
  }
  .advantages__text {
    width: auto;
  }
  .advantages__title {
    font-size: 20px;
  }
  .advantages__subtitle {
    font-size: 16px;
  }
  .box-title-button {
    padding: 0 30px 0 0;
  }
  /* .box-main  */
  .box-main .row .col-6 {
    flex: 0 0 50%;
    max-width: 50%;
  }
  .box-main__title {
    font-size: 40px;
  }
  .form__input-box {
    width: 660px;
  }
  .input_box {
    width: 460px;
    height: 45px;
    font-size: 14px;
  }
  .row-box {
    gap: 30px;
    grid-template-columns: 50% 50%;
  }
  .box-col {
    width: 500px;
  }
  .box-col__title {
    font-size: 21px;
  }
  .col__title {
    font-size: 14.5px;
  }
  .box-image {
    left: 100px;
    top: 60px;
    width: 450px;
    height: 300px;
  }
  .main-table__box {
    width: 280px;
  }
  /* .box-steps  */
  .box-steps-item__text {
    width: 370px;
  }
  .box-steps__items {
    display: flex;
    justify-content: center;
  }
  .box-steps__item {
    width: 370px;
  }
  .table-box__title {
    font-size: 25px;
    text-align: center;
  }
  .box-col__text {
    width: 350px;
    font-size: 14px;
  }
  .ellipse {
    width: 290px;
  }
}
@media screen and (max-width: 1318px) {
  .box-main-applications {
    height: 2000px;
  }
  .container {
    max-width: 1250px;
    width: 100%;
  }
  .main-banner {
    width: 98%;
  }
  .box-banner {
    width: 96%;
  }
  /* .box-steps  */
  .box-steps-item__text {
    width: 300px;
  }
  .box-steps__item {
    width: 300px;
  }
  .table-box__title {
    font-size: 25px;
    text-align: center;
  }
  .box-col__text {
    width: 300px;
    font-size: 14px;
  }
  .main-products {
    width: 98%;
  }
  .pc {
    width: 100%;
  }
  .document {
    width: 100%;
  }
  .cred-card {
    width: 100%;
  }
  .main-about-box__items {
    justify-content: center;
  }
  .main-about-box__item {
    width: 300px;
  }
  .ellipse {
    width: 280px;
    height: 70px;
    top: 108px;
    left: 10px;
  }
  .box-numder {
    left: 127px;
  }
}
@media screen and (max-width: 1280px) {
  .rach-banner {
    width: 87%;
  }
  .box-banner {
    width: 95%;
  }
  .main-about-box__item {
    width: 265px;
  }
  .ellipse {
    width: 250px;
    height: 60px;
    top: 117px;
    left: 9px;
  }
}
@media screen and (max-width: 1207px) {
  .container {
    max-width: 1130px;
    overflow: hidden;
  }
  .box-main .row .col-6 {
    flex: 0 0 50%;
    max-width: 100%;
  }
  .box-col {
    width: 340px;
  }
  .box-image {
    left: 70px;
    top: 160px;
    width: 250px;
    height: 200px;
  }
  .box-col .btn-blue {
    width: 120px;
  }
  .box-tariffs .box-col .box-image {
    left: 150px;
    top: 130px;
    width: 250px;
    height: 200px;
  }
  .main-about-box__items {
    justify-content: center;
  }
  .main-about-box__item {
    width: 180px;
  }
  .ellipse {
    width: 160px;
    height: 40px;
    top: 137px;
    left: 10px;
  }
  .col-9 {
    flex: 0 0 70%;
    max-width: 75%;
    padding: 0 15px;
  }
  .rach-banner {
    max-width: 100%;
    width: 85%;
    height: 230px;
  }
  .rach-banner__title {
    font-size: 36px;
  }
  .rach-banner-text {
    font-size: 24px;
  }
}
@media screen and (max-width: 1160px) {
  .container {
    max-width: 1070px;
    overflow: hidden;
  }
  .row .translation {
    width: 410px;
    height: 350px;
    float: left;
  }
  .pc {
    height: 230px;
  }
  .document {
    height: 240px;
  }
  .cred-card {
    top: 120px;
    height: 250px;
    width: 380px;
  }
  .rach-banner {
    max-width: 96%;
  }
}
@media screen and (max-width: 1025px) {
  .container {
    max-width: 980px;
    margin: 0;
    padding: 15px;
    overflow: hidden;
  }
  .col-9 {
    flex: 0 0 65%;
    max-width: 65%;
    padding: 0 15px;
  }
  .rach-banner {
    max-width: 100%;
    width: 82%;
    height: 230px;
  }
  .main-about-box__items {
    justify-content: center;
  }
  .main-about-box__item {
    width: 180px;
  }
  .ellipse {
    width: 160px;
    height: 40px;
    top: 137px;
    left: 10px;
  }
  .pc {
    height: 180px;
  }
  .document {
    height: 200px;
  }
  .cred-card {
    top: 80px;
    height: 220px;
    width: 330px;
  }
  .main-product__title {
    font-size: 20px;
  }
  .box-info-line .btn-gray {
    margin: 30px auto;
  }
  /* .box-steps  */
  .box-steps-item__text {
    width: 250px;
  }
  .box-steps__item {
    width: 250px;
  }
  .box-col__text {
    width: 250px;
    font-size: 14px;
  }
  .form__input-box {
    width: 400px;
  }
  .row .translation {
    width: 310px;
    height: 250px;
    margin: 0 auto;
  }
  .box-banner {
    width: 92%;
  }
  .row .box-banner__content {
    width: 430px;
  }
  .box-banner__content-title {
    width: 430px;
  }
  .box-banner-text {
    width: 400px;
    font-size: 20px;
  }
  .modal-content {
    margin: 20px 150px;
  }
  .form__input-box {
    width: 600px;
    margin: 30px auto;
  }
  .modal-content .box-main__title {
    font-size: 34px;
    width: 600px;
    margin-bottom: 15px;
  }
  .input_box {
    width: 400px;
    font-size: 12px;
  }
  .main-applications-send {
    margin-top: 25px;
    display: inline-flex;
    justify-content: space-around;
    height: 80px;
    width: 600px;
  }
  .main-applications-send .btn-blue {
    height: 50px;
  }
  .box-numder {
    left: 105px;
  }
  .info-line__text {
    font-size: 14px;
    width: 380px;
  }
  .info-line-two ul {
    width: 380px;
    font-size: 14px;
  }
  .header-main__title {
    font-size: 50px;
  }
  .header-main__image img {
    width: 85%;
    overflow: hidden;
  }
}
@media screen and (max-width: 979px) {
  .container {
    max-width: 930px;
    margin: 0;
    padding: 15px;
    overflow: hidden;
  }
  .box-main-applications {
    height: 2500px;
  }
  .box-main .row {
    display: grid;
  }
  .box-main .row .col-6 {
    padding: 0;
  }

  .box-col__text {
    width: 380px;
  }
  .col__items {
    width: 450px;
  }
  .col__item {
    width: 170px;
  }
  .box-col .box-image {
    width: 450px;
    height: 350px;
    top: 8px;
    left: 300px;
  }
  .box-main__items .row {
    display: grid;
  }
  .box-col {
    width: 800px;
  }
  .box-tariffs .box-col .box-image {
    width: 450px;
    height: 350px;
    top: 8px;
    left: 300px;
  }
  .box-main__items .box-col__content {
    width: 550px;
  }
  .box-main__items .box-col__text {
    width: 500px;
  }
  .info-line-one {
    flex: 0 0 40%;
    max-width: 87%;
  }
  .info-line-two {
    flex: 0 0 40%;
    max-width: 87%;
  }
  .box-info-line {
    width: 100%;
    overflow: hidden;
  }
  .box-steps__item {
    width: 200px;
  }
  .box-steps-item__text {
    width: 200px;
  }
  .box-numder {
    left: 82px;
  }
}
@media screen and (max-width: 830px) {
  .main-product__title {
    font-size: 18px;
  }
  .pc {
    height: 140px;
  }
  .document {
    height: 140px;
    width: 240px;
  }
  .cred-card {
    top: 90px;
    height: 160px;
    width: 200px;
  }
  .rach-banner {
    max-width: 100%;
    width: 79%;
    height: 230px;
  }
  .box-col {
    width: 700px;
  }

  .main-applications-content {
    padding: 0 15px;
    width: 600px;
    padding-top: 100px;
    padding-bottom: 100px;
  }
  .main-applications-content .box-main__title {
    font-size: 30px;
    text-align: center;
    width: 550px;
    margin: 0 auto;
  }
  .main-applications-buttons {
    width: 600px;
    height: 60px;
    margin-top: 30px;
  }
  .button {
    height: 53px;
    width: 294px;
    font-size: 12px;
  }
  .main-applications-button {
    height: 53px;
    width: 294px;
    font-size: 12px;
  }
  .form-input {
    width: 600px;
  }
  .input_person {
    width: 550px;
    height: 50px;
  }
  .main-applications-send {
    display: flex;
    gap: 20px;
  }
  .main-applications-send .btn-white {
    width: 320px;
  }
  .header-main__image img {
    width: 82%;
    overflow: hidden;
  }
}
@media screen and (max-width: 769px) {
  .container {
    max-width: 720px;
    margin: 0;
    padding: 15px;
    overflow: hidden;
  }
  .header-main__title {
    font-size: 36px;
  }
  .header-main__image img {
    width: 80%;
    overflow: hidden;
  }
  .advantages__image {
    width: 70px;
    height: 70px;
  }
  .main-banner__image {
    width: 230px;
  }
  .banner__title {
    font-size: 22px;
  }
  .banner-text {
    font-size: 11px;
  }
  .main-banner .btn-white {
    width: 150px;
    height: 40px;
    display: grid;
    align-content: center;
  }
  .info-line__text {
    font-size: 10px;
    height: 80px;
    width: 280px;
  }
  .info-line-two ul {
    font-size: 10px;
    height: 130px;
    width: 255px;
  }
  .ellipse {
    width: 145px;
  }
  .main-applications-content {
    padding: 0 15px;
    width: 600px;
    padding-top: 100px;
    padding-bottom: 100px;
  }
  .main-applications-content .box-main__title {
    font-size: 30px;
    text-align: center;
    width: 550px;
    margin: 0 auto;
  }
  .main-applications-buttons {
    width: 600px;
    height: 60px;
    margin-top: 30px;
  }
  .button {
    height: 53px;
    width: 294px;
    font-size: 12px;
  }
  .main-applications-button {
    height: 53px;
    width: 294px;
    font-size: 12px;
  }
  .form-input {
    width: 600px;
  }
  .input_person {
    width: 550px;
    height: 50px;
  }
  .main-applications-send {
    display: flex;
    gap: 20px;
  }
  .main-applications-send .btn-white {
    width: 320px;
  }
}
</style>
