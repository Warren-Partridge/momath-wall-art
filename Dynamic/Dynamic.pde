import processing.serial.*;
import processing.net.*;
import controlP5.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import blueTelescope.dynamicWall.util.*;
import blueTelescope.dynamicWall.core.*;
import blueTelescope.dynamicWall.cacher.*;
import blueTelescope.dynamicWall.anim.*;
import blueTelescope.dynamicWall.lib.*;
import blueTelescope.dynamicWall.app.*;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

DynamicWallLib wallLib;

WallAnimation anim = new Animation();

void setup() {
  size(1280, 480, P3D);

  frameRate(30);

  wallLib = new DynamicWallLib(this, false);

  anim.setup();
  wallLib.currentAnimation = anim;
}

void draw() {
  wallLib.draw();
}

void keyPressed() {
  wallLib.keyPressed();
}