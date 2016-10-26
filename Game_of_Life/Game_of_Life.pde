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
  
}

int col_no=100, row_no=100;
boolean arr[][]= new boolean[col_no][row_no];
boolean arr_second[][]= new boolean[col_no][row_no];
float cell_width, cell_height;

void draw()
{
  if(frameCount % 15 == 0)
  {
    display_board();
    copy_array();   
    update_board();
  }
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
  background(0);
  
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

void copy_array()
{
  for(int i=0; i < col_no; i++)
  {
    for(int j=0; j< row_no; j++)
    {
      arr_second[i][j]= arr[i][j];
    }
  }
}

void update_board()
{
  
  for(int i=0; i < col_no; i++)
  {
    for(int j=0; j< row_no; j++)
    {
      cells_alive(i,j);
    }
  }
}

void cells_alive(int x, int y)
{
  int index1, index2;
  int counter=0;
  
    
  if( (x != 0) && (x != 99) && (y != 0) && (y != 99) )
  {
    /*
    for(index1 = x-1; index1 < x+2; index1++)
    {
      for(index2 = y-1; index2 < y+2; index2++)
      {
        if( (index1 != x) && (index2 != y))
        {
          if( arr_second[index1][index2] == true )
          {
            counter++;
          } // End inner if
        } // End outer if
      } // End inner for
    } // End outer for
    */
    
    if(arr_second[x-1][y-1] == true) counter++;
    if(arr_second[x-1][y] == true) counter++;
    if(arr_second[x-1][y+1] == true) counter++;
    if(arr_second[x][y-1] == true) counter++;
    if(arr_second[x][y+1] == true) counter++;
    if(arr_second[x+1][y-1] == true) counter++;
    if(arr_second[x+1][y] == true) counter++;
    if(arr_second[x+1][y+1] == true) counter++;
    

} // End first if
  
  /*else
  {
    if( x== 0 && y != 0 || y != 99)
    {
      for(index1 = x; index1 < x+2; index1++)
      {
        for(index2 = y-1; index2 < y+2; index2++)
        {
          if( (index1 != x) && (index2 != y))
          {
            if( arr_second[index1][index2] == true )
            {
              counter++;
            } // End inner if
          } // End outer if
        } // End inner for
      } // End outer for
    }
    else
    {
      if( x== 98 && y != 1 || y != 98)
      {
        for(index1 = x-1; index1 < x+1; index1++)
        {
          for(index2 = y-1; index2 < y+2; index2++)
          {
            if( (index1 != x) && (index2 != y))
            {
              if( arr_second[index1][index2] == true )
              {
                counter++;
              } // End inner if
            } // End outer if
          } // End inner for
        } // End outer for
      }
      else
      {
        if( y== 0 && x != 0 || x != 99)
        {
            for(index1 = x-1; index1 < x+2; index1++)
            {
              for(index2 = y; index2 < y+2; index2++)
              {
                if( (index1 != x) && (index2 != y))
                {
                  if( arr_second[index1][index2] == true )
                  {
                    counter++;
                  } // End inner if
                } // End outer if
              } // End inner for
            } // End outer for
        }
        else
        {
          if( y== 99 && x != 0 || x != 99)
          {
            for(index1 = x-1; index1 < x+2; index1++)
            {
              for(index2 = y-1; index2 < y+1; index2++)
              {
                if( (index1 != x) && (index2 != y))
                {
                  if( arr_second[index1][index2] == true )
                  {
                    counter++;
                  } // End inner if
                } // End outer if
              } // End inner for
            } // End outer for
          }
          else
          {
            if( x== 0 && y == 0)
            {
               for(index1 = x; index1 < x+2; index1++)
              {
                for(index2 = y; index2 < y+2; index2++)
                {
                  if( (index1 != x) && (index2 != y))
                  {
                    if( arr_second[index1][index2] == true )
                    {
                      counter++;
                    } // End inner if
                  } // End outer if
                } // End inner for
              } // End outer for 
            }
            else
            {
              for(index1 = x-1; index1 < x+1; index1++)
              {
                for(index2 = y-1; index2 < y+1; index2++)
                {
                  if( (index1 != x) && (index2 != y))
                  {
                    if( arr_second[index1][index2] == true )
                    {
                      counter++;
                    } // End inner if
                  } // End outer if
                } // End inner for
              } // End outer for
            }
          }
        } // End 4th else
      } // End 3rd else
    } // End second else
  }
  */
  
  if(counter == 3)
  {
    toggle(x,y, true);
  }
  else
  {
    toggle(x,y,false);
  }
} // End cells alive

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