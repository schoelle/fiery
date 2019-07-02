unit Scanner;

interface

const
  TOK_EOF = 0;
  TOK_IDENT = 1;
  TOK_CURL_OPEN = 2;
  TOK_CURL_CLOSE = 3;
  TOK_COLON = 4;
  TOK_SQUARE_OPEN = 5;
  TOK_SQUARE_CLOSE = 6;
  TOK_COMMA = 7;
  TOK_ASSIGN = 8;
  TOK_ARROW = 9;
  TOK_DOT = 10;
  TOK_ANGLE_OPEN = 11;
  TOK_ANGLE_CLOSE = 12;
  TOK_INVALID = 255;
  
var
  lastToken: integer;
  lastIdent: string;

  procedure TokenOpenFile(name: string);
  procedure TokenNext();
  
implementation

uses
  Sysutils;

var
  lastChar: char;
  inputFile: TextFile;
  charAvailable: boolean;

  procedure NextChar();
  begin
    if not charAvailable or eof(inputFile) then
      charAvailable := false
    else
      read(inputFile, lastChar);
  end;

  procedure TokenOpenFile(name: string);
  begin
    AssignFile(inputFile, name);
    try
      Reset(inputFile);
      charAvailable := true;
      NextChar();
      TokenNext();
    except
      on E: EInOutError do
        writeln('File handling error occurred. Details: ', E.Message);
    end;
  end;

  procedure TokenNext();
  begin
    while charAvailable and ((lastChar = ' ') or (lastChar = #10)) do
      NextChar();
    if not charAvailable then
    begin
      lastToken := TOK_EOF
    end
    else if lastChar in ['a'..'z', 'A'..'Z'] then
    begin
      lastIdent := '';
      while lastChar in  ['a'..'z', 'A'..'Z','0'..'9','_'] do
      begin
        lastIdent := lastIdent + lastChar;
        NextChar();
      end;
      lastToken := TOK_IDENT;
    end
    else
    begin
      case lastChar of
        ':': begin
               NextChar();
               case lastChar of
                 '=': lastToken := TOK_ASSIGN;
               else
                 lastToken := TOK_COLON;
               end;
             end;
        '{': begin
               lastToken := TOK_CURL_OPEN;
               NextChar();
             end;
        '}': begin
               lastToken := TOK_CURL_CLOSE;
               NextChar();
             end;
        '[': begin
               lastToken := TOK_SQUARE_OPEN;
               NextChar();
             end;
        ']': begin
               lastToken := TOK_SQUARE_CLOSE;
               NextChar();
             end;
        '<': begin
               lastToken := TOK_ANGLE_OPEN;
               NextChar();
             end;
        '>': begin
               lastToken := TOK_ANGLE_CLOSE;
               NextChar();
             end;
        ',': begin
               lastToken := TOK_COMMA;
               NextChar();
             end;
        '.': begin
               lastToken := TOK_DOT;
               NextChar();
             end;
        '-': begin
               NextChar();
               case lastChar of                 
                 '>': begin
                        lastToken := TOK_ARROW;
                        NextChar();
                      end;
               else
                 lastToken := TOK_INVALID;
               end;
             end;
      else
        lastToken := TOK_INVALID
      end;
    end;
  end;
  
end.
  
