# Generated by protoc_gen_nim. Do not edit!

import base64
import intsets
import json
import strutils

import nimpb/nimpb
import nimpb/json as nimpb_json

type
    google_protobuf_Any* = ref google_protobuf_AnyObj
    google_protobuf_AnyObj* = object of Message
        typeUrl: string
        value: seq[byte]

proc newgoogle_protobuf_Any*(): google_protobuf_Any
proc newgoogle_protobuf_Any*(data: string): google_protobuf_Any
proc newgoogle_protobuf_Any*(data: seq[byte]): google_protobuf_Any
proc writegoogle_protobuf_Any*(stream: Stream, message: google_protobuf_Any)
proc readgoogle_protobuf_Any*(stream: Stream): google_protobuf_Any
proc sizeOfgoogle_protobuf_Any*(message: google_protobuf_Any): uint64

proc fullyQualifiedName*(T: typedesc[google_protobuf_Any]): string = "google.protobuf.Any"

proc readgoogle_protobuf_AnyImpl(stream: Stream): Message = readgoogle_protobuf_Any(stream)
proc writegoogle_protobuf_AnyImpl(stream: Stream, msg: Message) = writegoogle_protobuf_Any(stream, google_protobuf_Any(msg))

proc google_protobuf_AnyProcs*(): MessageProcs =
    result.readImpl = readgoogle_protobuf_AnyImpl
    result.writeImpl = writegoogle_protobuf_AnyImpl

proc newgoogle_protobuf_Any*(): google_protobuf_Any =
    new(result)
    initMessage(result[])
    result.procs = google_protobuf_AnyProcs()
    result.typeUrl = ""
    result.value = @[]

proc cleartypeUrl*(message: google_protobuf_Any) =
    message.typeUrl = ""

proc settypeUrl*(message: google_protobuf_Any, value: string) =
    message.typeUrl = value

proc typeUrl*(message: google_protobuf_Any): string {.inline.} =
    message.typeUrl

proc `typeUrl=`*(message: google_protobuf_Any, value: string) {.inline.} =
    settypeUrl(message, value)

proc clearvalue*(message: google_protobuf_Any) =
    message.value = @[]

proc setvalue*(message: google_protobuf_Any, value: seq[byte]) =
    message.value = value

proc value*(message: google_protobuf_Any): seq[byte] {.inline.} =
    message.value

proc `value=`*(message: google_protobuf_Any, value: seq[byte]) {.inline.} =
    setvalue(message, value)

proc sizeOfgoogle_protobuf_Any*(message: google_protobuf_Any): uint64 =
    if len(message.typeUrl) > 0:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(message.typeUrl)
    if len(message.value) > 0:
        result = result + sizeOfTag(2, WireType.LengthDelimited)
        result = result + sizeOfBytes(message.value)
    result = result + sizeOfUnknownFields(message)

proc writegoogle_protobuf_Any*(stream: Stream, message: google_protobuf_Any) =
    if len(message.typeUrl) > 0:
        protoWriteString(stream, message.typeUrl, 1)
    if len(message.value) > 0:
        protoWriteBytes(stream, message.value, 2)
    writeUnknownFields(stream, message)

proc readgoogle_protobuf_Any*(stream: Stream): google_protobuf_Any =
    result = newgoogle_protobuf_Any()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            settypeUrl(result, protoReadString(stream))
        of 2:
            expectWireType(wireType, WireType.LengthDelimited)
            setvalue(result, protoReadBytes(stream))
        else: readUnknownField(stream, result, tag)

proc serialize*(message: google_protobuf_Any): string =
    let
        ss = newStringStream()
    writegoogle_protobuf_Any(ss, message)
    result = ss.data

proc newgoogle_protobuf_Any*(data: string): google_protobuf_Any =
    let
        ss = newStringStream(data)
    result = readgoogle_protobuf_Any(ss)

proc newgoogle_protobuf_Any*(data: seq[byte]): google_protobuf_Any =
    let
        ss = newStringStream(cast[string](data))
    result = readgoogle_protobuf_Any(ss)


