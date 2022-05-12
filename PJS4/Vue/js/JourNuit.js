
    let jour = true;
      let nav = document.getElementsByClassName('navbar');
      function init() {

      }

      function changerTheme() {
      if(jour) {
        document.body.style.backgroundColor = "black";
        jour = false;
      }
      else {
        document.body.style.backgroundColor = "#c4d4eb";
        jour = true;
      }
      }
