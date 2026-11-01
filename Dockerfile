FROM python:3.11-slim-bookworm
WORKDIR /app
ENV PYTHONUNBUFFERED=1 PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
COPY setup.py README.md ./
COPY ashare_mcp/ ./ashare_mcp/
RUN pip install --no-cache-dir .
EXPOSE 9876
CMD ["python", "-c", "from ashare_mcp.server import mcp; mcp.run(transport='http', host='0.0.0.0', port=9876)"]
