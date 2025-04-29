//Data
let templates = {};
let questionsData;

/* --- | Load the data | --- */
function LoadData() {
    const urlParams = new URLSearchParams(window.location.search);
    const theme = urlParams.get("theme");
    //path of the folder and file names
    const templatesFolderPath = "../HTML/Templates/"
    const fileNames = ["Question", "Answer", "AnswerResult", "Score", "Video", "Photo", "Audio"]

    const jsonFolderPath = "../Questions/"
    const jsonFileName = "Testing.json"

    //loads templates
    Promise.all(fileNames.map(fileName => 
            fetch(templatesFolderPath + fileName + ".html")
                .then(response => response.text())
                .then(data => {
                    templates[fileName] = data;
                })
                .catch(error => console.error("Error loading JSON:", error))
    )).then(() => { //loads questions
        fetch('/PHP/Questions.php?theme=' + theme)
        .then(response => response.json())
        .then(data => {
            questionsData = data;
            //generates HTML
            if(questionsData.count == 0)window.location.replace("../index.html");
            console.log(questionsData);   
            GenerateQuestions(questionsData, templates);
        })
        .catch(error => {
            console.error("Error loading JSON:", error);
           // window.location.replace("../index.html");
        });
    });
}