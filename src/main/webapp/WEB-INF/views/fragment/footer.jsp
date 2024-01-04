<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer>
  <div class="container-fluid position-relative">
    <div id="content" class="content-container">
      <!-- ------------- Subscribe form and footer links ------------- -->
      <div class="row mt-5 pt-3">
        <div class="col-xl-6 col-lg-12 mb-4">
          <div class="bg-green p-5 h-100 rounded">
            <h3 class="tm-text-primary mb-3">Czy chcesz otrzymywać nasze najnowsze aktualizacje?</h3>
            <p class="mb-5">Zapisz się do naszego newslettera, aby być na bieżąco. Dziękuję.</p>
            <form action="" method="GET" class="subscribe-form">
              <input type="text" name="email" placeholder="Twój email..." required autocomplete="off">
              <button type="submit" class="btn bg-darkseagreen btn-small">Subskrybuj</button>
            </form>
          </div>
        </div>

        <!-- ------------- About project ------------- -->
        <div id="about" class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
          <div class="p-5 bg-green h-100 rounded">
            <h3 class="tm-text-primary mb-4">O projekcie</h3>
            <ul class="list-unstyled tm-footer-links">
              <li class="mb-2">Wszelkie informacje znajdują się pod poniższym linkiem do repozytorium</li>
              <li class="h2">
                <a href="https://github.com/ZWasilonek/HerbaLand" target="_blank">
                  <i class="fab fa-github"></i> GitHub
                </a>
              </li>
            </ul>
          </div>
        </div>

        <!-- ------------- Contact ------------- -->
        <div id="contact" class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
          <div class="p-5 tm-bg-green h-100 rounded">
            <h3 class="tm-text-primary mb-4">Kontakt</h3>
            <ul class="list-unstyled tm-footer-links">
              <li class="mb-3">Zofia Wasilonek</li>
              <li class="mb-3"><a href="https://www.linkedin.com/in/zofia-wasilonek/" target="_blank">
                  <i class="fab fa-linkedin"></i> LinkedIn</a>
              </li>
              <li style="font-size:13px;">
                <i class="fab fa-google"></i> zofia.wasilonek@gmail.com
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>