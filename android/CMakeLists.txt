cmake_minimum_required(VERSION 3.4.1)  # for example

include_directories(../br/include)

add_library( brotli

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
        ../br/common/constants.c ../br/common/context.c ../br/common/dictionary.c ../br/common/platform.c ../br/common/shared_dictionary.c ../br/common/transform.c ../br/dec/bit_reader.c ../br/dec/decode.c ../br/dec/huffman.c ../br/dec/state.c ../br/enc/backward_references.c ../br/enc/block_splitter.c ../br/enc/command.c ../br/enc/compress_fragment_two_pass.c ../br/enc/encoder_dict.c ../br/enc/histogram.c ../br/enc/metablock.c ../br/enc/backward_references_hq.c ../br/enc/brotli_bit_stream.c ../br/enc/compound_dictionary.c ../br/enc/dictionary_hash.c ../br/enc/entropy_encode.c ../br/enc/literal_cost.c ../br/enc/static_dict.c ../br/enc/bit_cost.c ../br/enc/cluster.c ../br/enc/compress_fragment.c ../br/enc/encode.c ../br/enc/fast_log.c ../br/enc/memory.c ../br/enc/utf8_util.c ../br/tools/brotli.c)
