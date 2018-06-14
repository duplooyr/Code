function setup() {
    var canvasw = 500
    var canvash = 500
    createCanvas(canvasw, canvash);
    x = 30
    y = 30

}

function draw() {
    background(30);
    // Controls Cube
    if (keyIsDown(LEFT_ARROW))
        x -= 5;
    if (keyIsDown(RIGHT_ARROW))
        x += 5;
    if (keyIsDown(UP_ARROW))
        y -= 5;
    if (keyIsDown(DOWN_ARROW))
        y += 5;

    // Cube
    fill(255) // Body Color
    noStroke()
    rect(x, y, 30, 30) // Body
    fill(0) // Eye Color
    rect(x + 3, y + 5, 10, 10) // L Eye
    rect(x + 17, y + 5, 10, 10) // R Eye

    // Restraints
    if (x < -40) {
        x = 20
    }
    if (x > 540) {
        x = -40
    }

    // Text
    textSize(32);
    fill(255)
    text("0",10,30)
    







}