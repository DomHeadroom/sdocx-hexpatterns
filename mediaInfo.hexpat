#pragma description mediaInfo.dat hexpattern
#pragma endian little

#include "time_ms.pat"

struct MediaFileEntry {
    u32 data_size;                         // Size in bytes of this entry payload
    u32 file_id;                           // Unique media file ID within the note
    u16 filename_length;                   // Number of characters in filename
    char16 filename[filename_length];      // Filename string (UTF-16LE)
    char file_hash[64];                    // SHA-256 hash in 64-character ASCII hex
    u16 ref_count;                         // Number of references using this media file
    type::time64_t modified_time;          // Microsecond timestamp formatted via time_ms.pat
    u8 is_file_attached;                   // 1 if file is physically stored in media/
};

struct MediaInfoFile {
    u32 format_version;                    // Format version (e.g. 5500, 5304, 4000)
    u16 file_count;                        // Number of media files
    MediaFileEntry files[file_count];      // Media files array
    char end_tag[4];                       // "EOFX" trailer
};

MediaInfoFile media_info @ 0x00;
