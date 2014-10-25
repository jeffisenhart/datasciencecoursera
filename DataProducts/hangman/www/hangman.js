var currentWord = "";
var guesses = [];
var correct = 0;
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var wins = 0;
var losses = 0;

function showEmptyWord(theWord,containerElement) {
      currentWord = theWord;
      guesses = [];
      correct = 0;
      document.getElementById("answer").innerHTML = "";
      //alert(currentWord);
      var html = "<table><tr>";
      var idx = 0;
      for(idx = 0;idx < currentWord.length; idx++){
            var id = "char_" + idx;
            html += "<td><div style='border:1px solid black;padding:6px;font-size:xx-large;' id='" + id + "'>?</div></td>"
      }
      html += "</tr></table>"
      containerElement.innerHTML = html;
}

function resetAlpha(containerElement) {
      
      var html = "<table><tr>";
      for(var i=0; i<alphabet.length; i++){
            var nextChar = alphabet.charAt(i);
            if( i % 5 == 0 ){
                  html += "</tr><tr>"
            }
            html += "<td><button id='alpha_" + i + "' onclick='guess(" + i + ");' class='btn btn-default'>" + alphabet.charAt(i) + "</button></td>"
	 }
       if( endsWith(html,"td>")){
             html += "</tr>"
       }
       html += "</table>"
       containerElement.innerHTML = html;
       
}

function guess(index) {
    if( guesses.length >= 6 || correct == currentWord.length ){
      return;
    }
    var button = document.getElementById("alpha_" + index);
    if( button ){
          button.setAttribute("disabled","disabled");
    }
    
    var found = false;
    for(idx = 0;idx < currentWord.length; idx++){
            if( currentWord.substring(idx,idx+1).toUpperCase() == alphabet.substring(index,index+1) ){
                  document.getElementById("char_" + idx).innerHTML = alphabet.substring(index,index+1);
                  correct = correct + 1;
                  found = true;
            }
      }
      if( correct == currentWord.length ){
             //alert("Winner!");
             wins++;
             //Shiny.onInputChange("newGame", null);
             //Shiny.onInputChange("win", new Date());
             document.getElementById("hm").src = "win.png";
             drawChart();
      }
      if( !found ){
            guesses.push(alphabet.charAt(index));
            document.getElementById("hm").src = "hang" + guesses.length + ".png"; 
            if( guesses.length >= 6 ){
                  losses++;
                  document.getElementById("hm").src = "hang6.png";
                  document.getElementById("answer").innerHTML = "<h3 style='color:red;'>Answer: <i>" + currentWord + "</i></h3>";
                  //Shiny.onInputChange("loss", new Date());
                  //Shiny.onInputChange("newGame", null);
                  drawChart();
                  
            }
      }
}
function drawChart(){
      
          $('#winLoss').highcharts({
              chart: {
                  plotBackgroundColor: null,
                  plotBorderWidth: 1,//null,
                  plotShadow: false
              },
              title: {
                  text: 'Wins: ' + wins + ', Losses: ' + losses
              },
              tooltip: {
                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
              },
              plotOptions: {
                  pie: {
                      allowPointSelect: false,
                      cursor: 'pointer',
                      showInLegend: true
                  }
              },
              series: [{
                  type: 'pie',
                  name: 'Ratio',
                  data: [
                      ['Wins',   wins/(wins+losses)],
                      ['Losses',       losses/(wins+losses)]
                  ]
              }]
          });
      
}
function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}