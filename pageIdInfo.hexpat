#pragma description pageIdInfo.dat hexpattern

struct PageFile {
     u16 entry_size;
     char16 file_name[entry_size] [[comment("UUID")]];;
     char16 content_hash[0x10];
};

struct PageFileCollection {
   if (page_file_count != 0 ) {
      PageFile pages[page_file_count];
   }
};

char16 note_file_hash[0x10] @ 0x00;
u16 page_file_count @ 0x20;

PageFileCollection page_files @ 0x22;
