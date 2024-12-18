CREATE OR REPLACE FUNCTION is_xmas(word text)
RETURNS boolean AS $$
BEGIN
    RETURN word = 'XMAS' OR word = 'SAMX';
END;
$$ LANGUAGE plpgsql;

-- TODO: rewrite it using only select and joins on table without function and forloop
CREATE OR REPLACE FUNCTION day4(text_rows text[])
RETURNS integer as $$
DECLARE
    rows integer;
    cols integer;
    count integer := 0;
    search_string text;
BEGIN
    rows := array_length(text_rows, 1);
    cols := length(text_rows[1]);
    
    -- HORIZONAL 
    FOR i IN 1..rows LOOP
        FOR j IN 1..cols-3 LOOP
            search_string := substr(text_rows[i] ,j ,4);
            IF is_xmas(search_string) THEN
                count := count + 1;
            END IF;
        END LOOP;
    END LOOP;

    -- VERTICAL
    FOR j IN 1..cols LOOP
        FOR i IN 1..rows-3 LOOP
            search_string := substr(text_rows[i] ,j , 1) || 
                          substr(text_rows[i+1] ,j , 1) ||
                          substr(text_rows[i+2] , j ,1) ||
                          substr(text_rows[i+3] ,j ,1);
            IF is_xmas(search_string) THEN
                count := count + 1;
            END IF;
        END LOOP;
    END LOOP;

    -- DIAGONAL
    FOR i IN 1..rows-3 LOOP
        FOR j IN 1..cols-3 LOOP
            search_string := substr(text_rows[i] ,j ,1) ||
                          substr(text_rows[i+1] ,j+1 ,1) ||
                          substr(text_rows[i+2] ,j+2 ,1) ||
                          substr(text_rows[i+3] ,j+3,1);
            IF is_xmas(search_string) THEN
                count := count + 1;
            END IF;
        END LOOP;
    END LOOP;

    -- OTHER DIAGONAL 
    FOR i IN 1..rows-3 LOOP
        FOR j IN 4..cols LOOP
            search_string := substr(text_rows[i] ,j ,1) ||
                          substr(text_rows[i+1] ,j-1 ,1) ||
                          substr(text_rows[i+2] ,j-2 ,1) ||
                          substr(text_rows[i+3] ,j-3 ,1);
            IF is_xmas(search_string) THEN
                count := count + 1;
            END IF;
        END LOOP;
    END LOOP;
    
    RETURN count;
END;
$$ LANGUAGE plpgsql;
