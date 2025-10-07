import os
import re
import csv
from statistics import mean

BASE_DIR = "./"
PROGRAMS = ["gemm", "gemver", "jacobi-2d"]
VERSIONS = ["default", "o0", "o3", "ofast"]
RUNS = 3

def parse_perf(file_path):
    """Extrai todas as métricas relevantes do arquivo perf"""
    metrics = {}
    with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
        text = f.read()

    def find_float(pattern):
        m = re.search(pattern, text)
        return float(m.group(1).replace(",", ".")) if m else None

    # métricas principais
    metrics["task_clock_ms"] = find_float(r"([\d,.]+)\s+msec task-clock")
    metrics["cpus_utilized"] = find_float(r"#\s+([\d,.]+)\s+CPUs utilized")
    metrics["context_switches"] = find_float(r"([\d,.]+)\s+context-switches")
    metrics["cpu_migrations"] = find_float(r"([\d,.]+)\s+cpu-migrations")
    metrics["page_faults"] = find_float(r"([\d,.]+)\s+page-faults")
    metrics["instructions"] = find_float(r"([\d,.]+)\s+instructions")
    metrics["ipc"] = find_float(r"#\s+([\d,.]+)\s+insn per cycle")
    metrics["cycles"] = find_float(r"([\d,.]+)\s+cycles")
    metrics["ghz"] = find_float(r"#\s+([\d,.]+)\s+GHz")
    metrics["branches"] = find_float(r"([\d,.]+)\s+branches")
    metrics["branch_misses"] = find_float(r"([\d,.]+)\s+branch-misses")
    metrics["branch_misses_percent"] = find_float(r"#\s+([\d,.]+)% of all branches")

    # TopdownL1
    metrics["tma_backend_bound"] = find_float(r"#\s+([\d,.]+)\s*%\s*tma_backend_bound")
    metrics["tma_bad_speculation"] = find_float(r"#\s+([\d,.]+)\s*%\s*tma_bad_speculation")
    metrics["tma_frontend_bound"] = find_float(r"#\s+([\d,.]+)\s*%\s*tma_frontend_bound")
    metrics["tma_retiring"] = find_float(r"#\s+([\d,.]+)\s*%\s*tma_retiring")

    # tempos finais
    metrics["time_elapsed_s"] = find_float(r"([\d,.]+)\s+seconds time elapsed")
    metrics["user_s"] = find_float(r"([\d,.]+)\s+seconds user")
    metrics["sys_s"] = find_float(r"([\d,.]+)\s+seconds sys")

    return metrics


results = []
for prog in PROGRAMS:
    for ver in VERSIONS:
        dir_path = os.path.join(BASE_DIR, prog, ver)
        if not os.path.isdir(dir_path):
            print(f"[!] Diretório não encontrado: {dir_path}")
            continue

        runs = []
        for i in range(1, RUNS + 1):
            file_path = os.path.join(dir_path, f"run{i}.txt")
            if os.path.isfile(file_path):
                runs.append(parse_perf(file_path))
            else:
                print(f"[!] Arquivo não encontrado: {file_path}")

        if not runs:
            print(f"[!] Nenhum arquivo encontrado para {prog}/{ver}")
            continue

        avg = {}
        keys = runs[0].keys()
        for k in keys:
            vals = [r[k] for r in runs if r[k] is not None]
            avg[k] = mean(vals) if vals else None

        results.append({
            "program": prog,
            "version": ver,
            **avg
        })

if not results:
    print("\n[ERRO] Nenhum resultado foi encontrado!")
    print("Verifique se os arquivos run1.txt, run2.txt e run3.txt existem em:")
    print("  ./gemm/default/, ./gemm/o0/, ./gemm/o3/, ./gemm/ofast/, etc.\n")
    exit(1)

# === Gerar CSV ===
csv_path = os.path.join(BASE_DIR, "resultados_perf_completo.csv")
header = ["program", "version"] + list(results[0].keys())[2:]

with open(csv_path, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    for r in results:
        writer.writerow([r.get(k, "") for k in header])

# === Gerar Tabela Markdown ===
md_path = os.path.join(BASE_DIR, "resultados_perf_completo.md")
with open(md_path, "w", encoding="utf-8") as f:
    f.write("| " + " | ".join(header) + " |\n")
    f.write("|" + "|".join(["---"] * len(header)) + "|\n")
    for r in results:
        row = []
        for k in header:
            v = r.get(k)
            if isinstance(v, float):
                row.append(f"{v:.3f}")
            elif v is None:
                row.append("-")
            else:
                row.append(str(v))
        f.write("| " + " | ".join(row) + " |\n")

print(f"\n[✓] CSV salvo em: {csv_path}")
print(f"[✓] Markdown salvo em: {md_path}")
