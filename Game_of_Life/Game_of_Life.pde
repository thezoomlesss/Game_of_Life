/*

To do:
  - Check how many cells around are alive
  - Turn on/off cells function
  
*/

void setup()
{
  size(600,600);
  background(0);
  stroke(1);
  fill(0,255,0);
  /*
      Calculating the size of a single sell and making a full array cover the whole screen
  */
  cell_width = width/ (float)col_no;
  cell_height = height/ (float)row_no;

  random_board();   // Initializing the board with random spawns
  display_board();
}

int col_no=100, row_no=100;
boolean arr[][]= new boolean[col_no][row_no];
int arr_second[][]= new int[col_no][row_no];
float cell_width, cell_height;

void draw()
{
  
}

void random_board()
{
  
  for(int i=0; i < col_no; i++)
  {
    for(int j=0; j< row_no; j++)
    {
      if(random(0,1) > 0.5f)
      {
        toggle(i,j,true);
      }
    }
  }
}

void display_board()
{
  for(int i=0; i < col_no; i++)
  {
    for(int j=0; j< row_no; j++)
    {
      if(arr[i][j]==true)
      {
        rect(i*cell_width, j* cell_height, cell_width, cell_height);
      }
    }
  }
  
}



void toggle(int x, int y, boolean c)
{
  if(c == true)
  {
    arr[x][y]=true;
  }
  else
  {
    arr[x][y]=false;
  }
}