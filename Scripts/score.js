//variables for score
let score = 0;
let randomNumber = 167;
let lastQuestionIndex;
let currentQuestion;

    /* --- | Checks Answer | --- */
function CheckAnswer(checked) {
    if (checked == null) return;

    //id of current current question
    currentQuestion = checked.parentElement.parentElement.id;
    
    //value of answer
    const answerValue = checked.innerText;
    
    //gets the object of the question
    const currentQuestionObject = questionsData.find(item => {
        return item.questionID == currentQuestion;
    });

    //Checks for last question
     lastQuestionIndex = Object.keys(questionsData).length;
    
    //sets the index of current question
    currentQuestion = questionsData.indexOf(currentQuestionObject);
    
    //id of player answer and correct answer
    const correctID = questionsData[currentQuestion].correctID;
    const selected = questionsData[currentQuestion].answers.indexOf(answerValue);
    
    //TODO 1: placeholder for correct and wrong answer
    const resultElement = document.getElementsByClassName("result")[currentQuestion];

    if (correctID == selected) {
        resultElement.style.backgroundColor = "green";
        score++;
        randomNumber++;
    } else resultElement.style.backgroundColor = "red";

    //deselects the answer
    checked = null;
    Slider()

    //moves the slide
    index++;
    UpdateSlider();
    if (currentQuestion == lastQuestionIndex-1) {
        DisplayScore();
    }

    //waits on the result for a sec
    setTimeout(() => {
        index++;
        UpdateSlider();
       
    }, resultWait * 1000);


   
}

function SendScore() {
    const cheated = (score != randomNumber-167);
    if (cheated) score = 0;

    const urlParams = new URLSearchParams(window.location.search);
    const theme = urlParams.get("theme");

    const data = {
        score: score,
        theme: theme
    }

    fetch('/PHP/Score.php', {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        }
        })
        .then(response => response.text())
        .then(data => {
            console.log(data);
            if (data == "logout") window.location.replace("login.html");
        })
        .catch(error => {
            console.error("Error:", error);
        });
 
}

function DisplayScore(){
    const procenta = (100 * score) / lastQuestionIndex;
    let text = document.getElementById("TextScore");
    
    if (procenta < 25 && procenta >= 0) {
        text.innerText = "Bože, ty jsi ale ňouma. Je čas se vrátit zpátky na TikTok a osvěžit si nějaké trendy.";
    } else if (procenta < 50 && procenta >= 25) {
        text.innerText = "Není to špatné, ale rizzler z tebe nebude.";
    } else if (procenta < 75 && procenta >= 50) {
        text.innerText = "To už ujde, ale máš ještě co pilovat.";
    } else if (procenta <= 100 && procenta >= 75) {
        text.innerText = "Masivní skóre, ale měl bys jít obnovit své spojení s přírodou.";
    }



    document.getElementById("FinalScore").innerText = "Hráč má scóre: " + Math.floor(procenta) +"%";
    SendScore();
}

function Slider() {
    let sliderBackground = document.body.getElementsByClassName("slider-background")[0];

    sliderBackground.style.width = (100 * (currentQuestion+1)) / lastQuestionIndex + "%";
}
