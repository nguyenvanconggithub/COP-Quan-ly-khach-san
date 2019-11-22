var star = [1, 1, 1, 1, 1];
if ($('#star').val() == 1) {
    star[0] = 1;
    star[1] = 0;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 0, 0, 0, 0);
    $('#star').val(1);
}
if ($('#star').val() == 2) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 0, 0, 0);
    $('#star').val(2);
}
if ($('#star').val() == 3) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 1, 0, 0);
    $('#star').val(3);
}
if ($('#star').val() == 4) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 0;
    setStarValue(1, 1, 1, 1, 0);
    $('#star').val(4);
}
if ($('#star').val() == 5) {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 1;
    setStarValue(1, 1, 1, 1, 1);
    $('#star').val(5);
}
$('#oneStar').hover(() => {
    setStarValue(1, 0, 0, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#twoStar').hover(() => {
    setStarValue(1, 1, 0, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#threeStar').hover(() => {
    setStarValue(1, 1, 1, 0, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#fourStar').hover(() => {
    setStarValue(1, 1, 1, 1, 0);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
$('#fiveStar').hover(() => {
    setStarValue(1, 1, 1, 1, 1);
}, () => {
    setStarValue(star[0], star[1], star[2], star[3], star[4]);
})
//ON CLICK set Value
$('#oneStar').click(() => {
    star[0] = 1;
    star[1] = 0;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 0, 0, 0, 0);
    $('#star').val(1);
})
$('#twoStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 0;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 0, 0, 0);
    $('#star').val(2);
})
$('#threeStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 0;
    star[4] = 0;
    setStarValue(1, 1, 1, 0, 0);
    $('#star').val(3);
})
$('#fourStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 0;
    setStarValue(1, 1, 1, 1, 0);
    $('#star').val(4);
})
$('#fiveStar').click(() => {
    star[0] = 1;
    star[1] = 1;
    star[2] = 1;
    star[3] = 1;
    star[4] = 1;
    setStarValue(1, 1, 1, 1, 1);
    $('#star').val(5);
})
function setStarValue(one, two, three, four, five) {
    $('#oneStar').removeClass("text-warning");
    $('#twoStar').removeClass("text-warning");
    $('#threeStar').removeClass("text-warning");
    $('#fourStar').removeClass("text-warning");
    $('#fiveStar').removeClass("text-warning");

    if (one == 1)
        $('#oneStar').addClass("text-warning");
    if (two == 1)
        $('#twoStar').addClass("text-warning");
    if (three == 1)
        $('#threeStar').addClass("text-warning");
    if (four == 1)
        $('#fourStar').addClass("text-warning");
    if (five == 1)
        $('#fiveStar').addClass("text-warning");
}