from mitmproxy import ctx
from mitmproxy.net.http.http1.assemble import assemble_request, assemble_response


def response(flow):
    ctx.log.info(assemble_request(flow.request).decode("utf-8"))
    flow.response.decode()
    ctx.log.info(assemble_response(flow.response).decode("utf-8"))
