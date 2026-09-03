#pragma description pageIdInfo.dat hexpattern
#pragma endian little

struct PageEntry {
    u16 page_id_char_count;              // Character count (usually 36 for standard UUID)
    char16 page_id[page_id_char_count];  // Page UUID string (UTF-16LE)
    u8 page_digest[32];                  // SHA-256 hash for incremental page sync
};

u8 note_digest[32] @ 0x00;               // Global SHA-256 hash of the note
u16 page_count @ 0x20;

PageEntry page_entries[page_count] @ 0x22;
