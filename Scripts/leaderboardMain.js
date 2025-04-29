let users = [];

    /* --- | Main | --- */
window.onload = function() {
    TokenValidation();
    Fetch();
};

function Fetch() {
    const urlParams = new URLSearchParams(window.location.search);
    const theme = urlParams.get("theme");

    fetch('/PHP/UserScore.php?theme='+theme)
        .then(res => res.json())
        .then(data => {
            for (let user of data) {
                users.push([user.Username, user.Score]);
            }
        }).then(data => {

            if(users.count == 0) window.location.replace("../index.html");
           
            users.sort((a, b) => b[1] - a[1]);

            const leaderboard = document.getElementsByClassName("leaderboard")[0];
            
            for (let i = 0; i < users.length; i++) {
                let row = document.createElement('tr');
                let thRank = document.createElement('th');
                let thName = document.createElement('th');
                let thScore = document.createElement('th');

                thRank.textContent = i+1;
                thName.textContent = users[i][0];
                thScore.textContent = users[i][1];

                row.append(thRank);
                row.append(thName);
                row.append(thScore);
                leaderboard.append(row);
            }
        }).catch(err => {
            console.error(err);
            window.location.replace("../index.html");
        });
}