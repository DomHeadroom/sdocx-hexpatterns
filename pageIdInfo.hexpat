#pragma description pageIdInfo.dat hexpattern

struct PageEntry {
    le u16 page_id_char_count;        // usually 36
    char16 page_id[page_id_char_count];
    u8 page_digest[0x20];             // 32 byte
};

struct PageEntryList {
    if (page_count != 0) {
        PageEntry pages[page_count];
    }
};

u8 note_digest[0x20] @ 0x00;          // 32 byte
le u16 page_count @ 0x20;

PageEntryList page_entries @ 0x22;
