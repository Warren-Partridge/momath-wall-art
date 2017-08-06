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
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.lang.*;

DynamicWallLib wallLib;

//WallAnimation anim = new FourierConvergence(); //new AnimFib, AnimPi, AnimSeq
WallAnimation anim = new Animation(); //new AnimFib, AnimPi, AnimSeq


void setup() {
  size(1280, 480, P3D);
  frameRate(6);

  wallLib = new DynamicWallLib(this, false);

  anim.setup();
  wallLib.currentAnimation = anim;
}

void draw() {
  rotateX(3*(PI/2)); //Best testing view
  

  //Comment Out These are test blocks
  //rotateX(PI);
  //rotateY(6*(PI/4) - 1*PI/32);
  //translate(0,0,150);
  ////Test block ends

  wallLib.draw();

}

void keyPressed() {
  wallLib.keyPressed();
}