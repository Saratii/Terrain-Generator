import java.util.Arrays;
void setup() {
  size(1200, 1200);
  background(0);
  noStroke();
  fill(102);
}
//25x25
int testX;
int testY;
int testX2;
int testY2;
int pondX;


String[][] array = new String[48][48];
String[] z1 = {"sky"};
String[] z2 = {"sky"};
String[] z3 = {"root", "dirt"};
String[] z4 = {"rock", "dirt"};
String[] z5 = {"rock", "dirt", "dirt"};
int sx;
int sy;

void start(){
  for(int i = 0; i<array.length;i++){
    for(int j = 0; j<array.length;j++){
      if(j<=10){
        array[i][j] = z1[0];
      } else if(j>10&&j<=20){
        array[i][j] = z2[0];
       } else if(j>20&&j<=26){
         array[i][j] = z3[int(random(0, 2))];
       } else if(j>26&&j<=34){
         array[i][j] = z4[int(random(0, 2))];
       } else if(j>34){
         array[i][j]=z5[int(random(0, 3))];
       } 
    }
  }
  // clouds
  for(int i = 0; i<9;i++){
    array[int(random(0, 48))][int(random(0, 1))] = "cloud";
  }
  for(int g = 0; g<900;g++){
    int row = int(random(0, 48));
    int col = int(random(0, 10));
    if((col+1<array.length && array[row][col+1] == "cloud")||
      (col-1>=0 && array[row][col-1] == "cloud")||
      (row+1<10 && array[row+1][col] == "cloud")|| 
      (row-1 >= 0 && array[row-1][col] == "cloud")){
        array[row][col] = "cloud";
    }
  }
  //grass
  String[] gwasses={"grass1", "grass2"};
  for(int i = 0; i<48; i++){
    array[i][21] = gwasses[int(random(0, 2))];
  }
  //pond
  int[] nps ={1,1,1,2,2,3};
  int np = nps[int(random(0,3))];
  //print("np: "+np + "\n");
  for(int l = 0; l<np; l++){
    int displacementL = int(random(1, 3));
    int displacementR = int(random(1, 3));
     print("left displacement: " + displacementL + "\n");
     print("right displacement: " + displacementR + "\n");
    pondX = int(random(0, 48));
    print(array[pondX][21]);
    //print("pondX: " + pondX + "\n");
    array[pondX][21] = "watuh";
    print(array[pondX][21]);
    int pondW = int(random(6, 12));
    for(int i = 0; i<pondW; i++){
      if(pondX-pondW/2+i >=0 && pondX-pondW/2+i< 48){
        array[pondX-pondW/2+i][21] = "watuh";
        print(array[pondX][21]);
      }
      if(pondX-pondW/2+i >=0 && pondX-pondW/2+i< 48){
        array[pondX-pondW/2+i][22] = "watuh";
      }
    } //JOE BIRON
    if(displacementL == 2){
      if(pondX-pondW/2+1 >=0 && pondX-pondW/2+1 < 48){
        array[pondX-pondW/2+1][22] = z3[int(random(0,2))];
      }
    }
    if(displacementR == 2){
      if(pondX+pondW/2-1 >=0 && pondX+pondW/2-1 < 48){
        //print("right 2 check \n");
        array[pondX+pondW/2-1][22] = z3[int(random(0,2))];
      }
    }
    if(pondX-pondW/2 >= 0 && pondX-pondW/2 < 48){
      //print("pondX-pondW/2: " + (pondX-pondW/2) + "\n");
      array[pondX-pondW/2][22] = z3[int(random(0,2))];
    }
    if(pondX+pondW/2 >= 0 && pondX+pondW/2 < 48){
      array[pondX+pondW/2][22] = z3[int(random(0,2))];
      //print(array[pondX+pondW/2][22]);
      
      testX = (pondX+pondW/2)*25;
      testY = 21*25;
    }
    if(pondX+pondW/2 >= 0 && pondX+pondW/2 < 48){
      //array[pondX+pondW/2-1][22] = "sky";
    }
    testX2 = pondX*25;
    testY2 = 22*25;
    print(array[pondX][21]);
  }
  
  //trees
  for(int i = 0; i<int(random(9, 17));i++){ 
    int x = int(random(0, 48));
    if(array[x][21] != "watuh"){
      array[x][20] = "tree";
    }
    int treeHeight = int(random(3,8));
    for(int j = 0; j<treeHeight; j++){
       if(array[x][21] != "watuh"){
         array[x][20-j] = "tree";
       }
    }
    if(array[x][21]!="watuh"){
      array[x][20-treeHeight] = "leeghth";
    }
  }
  for(int g = 0; g<900;g++){
    int row = int(random(0, 48));
    int col = int(random(5, 17));
    if((col+1<array.length && array[row][col+1] == "leeghth")||
      (col-1>=0 && array[row][col-1] == "leeghth")||
      (row+1<10 && array[row+1][col] == "leeghth")|| 
      (row-1 >= 0 && array[row-1][col] == "leeghth")){
       array[row][col] = "leeghth";
    }
  }
  //sun
  sx = int(random(0, 48*25));
  sy = int(random(25, 4*25));
  //print(Arrays.deepToString(array));
  print(array[pondX][21]);
}
void draw(){
  for (int col = 0; col < array.length; col++) {
    for (int row = 0; row < array[col].length; row++) {
       if(array[row][col] == "tree"){
         fill(128, 113, 83);
       } else if(array[row][col] == "rock"){
         fill(150, 150, 150); 
       } else if(array[row][col] == "sky"){
         fill(0, 204, 255);
       } else if(array[row][col] == "dirt"){
         fill(101, 67, 33);
       } else if(array[row][col] == "cloud"){
         fill(208, 204, 204);
       } else if(array[row][col] == "root"){
         fill(196, 116, 68);
       } else if(array[row][col] == "leeghth"){
         fill(111, 180, 64);
       } else if(array[row][col] == "grass1"){
         fill(111, 180, 64);
       } else if(array[row][col] == "grass2"){
         fill(190, 210, 100);
       } else if(array[row][col] == "watuh"){
         fill(38, 102, 145);
       }
       rect(row*25, col*25, 25, 25);   
       fill(255, 0, 0);
       rect(testX, testY, 5, 5);
       fill(0, 0, 255);
       rect(testX2, testY2, 5, 5);
    }
  }
  //sun
  fill(250, 253, 15);
  circle(sx, sy, 150); 
  print(array[pondX][21]);
}
