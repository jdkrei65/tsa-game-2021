// Player position
let position = {
  x: 150,
  y: 100
}

function setup() {
  createCanvas(600, 400);
  strokeWeight(0);
  fill(0);
}

// Player motion with the arrow keys
function move() {
  if (keyIsDown(RIGHT_ARROW)) {
    position.x += 1;
  } else if (keyIsDown(LEFT_ARROW)) {
    position.x -= 1;
  }
  if (keyIsDown(UP_ARROW)) {
    position.y -= 1;
  } else if (keyIsDown(DOWN_ARROW)) {
    position.y += 1;
  }
}

function draw() {
  move();
  background(255);
  circle(position.x, position.y, 30);
  textSize(32);
  text('Use Arrow Keys To Move', 10, 30);
}
